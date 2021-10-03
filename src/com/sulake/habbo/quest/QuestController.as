package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.communication.messages.outgoing.quest.ActivateQuestMessageComposer;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class QuestController implements IDisposable
   {
      
      private static const MODE_NO_TABS:String = "MODE_NO_TABS";
      
      private static const MODE_TABS:String = "MODE_TABS";
       
      
      private var var_65:HabboQuestEngine;
      
      private var var_109:Map;
      
      private var _selectedCampaign:QuestCampaign;
      
      private var var_691:Boolean = false;
      
      private var _window:IFrameWindow;
      
      private var var_1263:IWindowContainer;
      
      private var var_595:String;
      
      private var var_110:IWindowContainer;
      
      private var var_1262:Timer;
      
      private var var_1978:Boolean = false;
      
      private var var_280:QuestView;
      
      private var var_1535:Boolean;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         this.var_109 = new Map();
         super();
         this.var_65 = param1;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_109)
         {
            for each(_loc1_ in this.var_109)
            {
               _loc1_.dispose();
            }
            this.var_109.dispose();
            this.var_109 = null;
         }
         this.var_691 = true;
         if(this._window)
         {
            this._window.dispose();
         }
         this._window = null;
         if(this.var_280)
         {
            this.var_280.dispose();
            this.var_280 = null;
         }
         if(this.var_110 != null)
         {
            this.var_110.dispose();
            this.var_110 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_691;
      }
      
      private function reset() : void
      {
         if(this._selectedCampaign)
         {
            this._selectedCampaign.dispose();
            this._selectedCampaign = null;
         }
      }
      
      public function isVisible() : Boolean
      {
         return this._window && this._window.visible;
      }
      
      public function close() : void
      {
         if(this._window)
         {
            this._window.visible = false;
         }
      }
      
      public function show() : void
      {
         this.prepareWindow();
         this.refreshTabs();
         this.updateTabs();
         this.var_1535 = false;
      }
      
      public function questAccepted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this.var_109[param1];
         if(!_loc3_)
         {
            _loc3_ = new QuestCampaign(this,param1);
            this.var_109[param1] = _loc3_;
         }
         if(_loc3_)
         {
            _loc3_.questAccepted(param2);
         }
         if(this.var_280 != null && this.var_280.quest.id == param2.id)
         {
            this.showQuestReminder(_loc3_,new Quest(param2,_loc3_));
         }
      }
      
      public function questCompleted(param1:String, param2:QuestMessageData) : void
      {
         var _loc3_:QuestCampaign = this.var_109[param1];
         if(!_loc3_)
         {
            _loc3_ = new QuestCampaign(this,param1);
            this.var_109[param1] = _loc3_;
         }
         if(_loc3_)
         {
            _loc3_.questCompleted(param2);
         }
         if(this.var_280 != null && this.var_280.quest.id == param2.id && this.var_110 != null)
         {
            this.var_110.visible = false;
         }
      }
      
      public function activateQuest(param1:Quest) : void
      {
         if(param1)
         {
            this.var_65.communication.getHabboMainConnection(null).send(new ActivateQuestMessageComposer(param1.id));
         }
      }
      
      public function get questEngine() : HabboQuestEngine
      {
         return this.var_65;
      }
      
      public function openCampaign(param1:String, param2:int, param3:Array) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.var_1978)
         {
            this.var_1978 = false;
            _loc4_ = this.var_109[param1];
            _loc5_ = this.findFirstAvailableQuestFromQuestDatas(_loc4_,param3);
            if(_loc5_ == null)
            {
               return;
            }
            this.showQuestReminder(_loc4_,_loc5_);
            return;
         }
         if(this.var_595 != MODE_TABS)
         {
            this.var_595 = MODE_NO_TABS;
         }
         this.detachCampaign();
         _loc4_ = this.var_109[param1];
         if(!_loc4_)
         {
            _loc4_ = new QuestCampaign(this,param1);
            this.var_109[param1] = _loc4_;
         }
         _loc4_.activityPointType = param2;
         this._selectedCampaign = _loc4_;
         this._selectedCampaign.openCampaign(param3);
         this.prepareWindow();
         this.attachCampaign();
         if(this.var_595 == MODE_TABS)
         {
            this.refreshTabs();
            this.updateTabs();
         }
      }
      
      private function detachCampaign() : void
      {
         if(!this.var_1263)
         {
            return;
         }
         this.var_1263.removeChildAt(0);
      }
      
      private function attachCampaign() : void
      {
         if(!this._selectedCampaign)
         {
            return;
         }
         if(!this.var_1263)
         {
            return;
         }
         this._selectedCampaign.attachTo(this.var_1263);
         var _loc1_:String = "quest_" + this._selectedCampaign.code;
         var _loc2_:* = _loc1_ + ".title";
         this._window.caption = "${" + _loc2_ + "}";
      }
      
      public function openCampaigns(param1:Array, param2:Boolean = false) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(this.var_595 != MODE_TABS)
         {
            this.reset();
            if(this._window)
            {
               this._window.dispose();
               this._window = null;
            }
         }
         this.var_595 = MODE_TABS;
         for each(_loc3_ in param1)
         {
            _loc4_ = this.var_109[_loc3_];
            if(!_loc4_)
            {
               _loc4_ = new QuestCampaign(this,_loc3_);
               this.var_109[_loc3_] = _loc4_;
            }
            _loc4_.expired = param2;
         }
         if(this.var_1262 != null)
         {
            this.var_1262.start();
         }
      }
      
      private function updateTabs() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc1_:String = !!this._selectedCampaign ? this._selectedCampaign.code : this.resolveDefaultCampaignCode();
         if(_loc1_ != "")
         {
            _loc2_ = this._window.findChildByName("campaigns") as ITabContextWindow;
            _loc3_ = _loc2_.getTabItemByName("tab_" + _loc1_);
            if(_loc3_)
            {
               _loc2_.selector.setSelected(_loc3_);
               if(this._selectedCampaign == null)
               {
                  this.var_65.getQuestCampaign(_loc1_);
               }
            }
         }
      }
      
      private function resolveDefaultCampaignCode() : String
      {
         if(this.var_65.defaultCampaignCode.length > 0)
         {
            return this.var_65.defaultCampaignCode;
         }
         if(this.var_109.getKeys().length > 0)
         {
            return this.var_109.getKeys()[0];
         }
         return "";
      }
      
      public function updatePurse() : void
      {
         if(!this._selectedCampaign)
         {
            return;
         }
         this._selectedCampaign.updatePurse();
      }
      
      private function prepareWindow() : void
      {
         var _loc1_:* = null;
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         switch(this.var_595)
         {
            case MODE_NO_TABS:
               _loc1_ = "QuestEngine";
               break;
            case MODE_TABS:
               _loc1_ = "QuestEngineTabs";
               break;
            default:
               _loc1_ = "QuestEngine";
         }
         this._window = IFrameWindow(this.var_65.getXmlWindow(_loc1_));
         this._window.findChildByTag("close").procedure = this.onWindowClose;
         this._window.center();
         this.var_1263 = this._window.findChildByName("content") as IWindowContainer;
      }
      
      public function initializeReminderTimer() : void
      {
         if(this.var_65.configuration.getKey("questing.reminder.enabled","") != "ParkBusCannotEnterMessageEvent")
         {
            Logger.log("Reminder timer not enabled");
            return;
         }
         var _loc1_:int = int(this.questEngine.configuration.getKey("questing.reminder.remindPeriodInSeconds","30"));
         this.var_1262 = new Timer(_loc1_ * 1000);
         this.var_1262.addEventListener(TimerEvent.TIMER,this.onReminderTimer);
         Logger.log("Initialized reminder timer with period: " + _loc1_);
      }
      
      public function onReminderTimer(param1:TimerEvent) : void
      {
         if(this._window != null && this._window.visible)
         {
            return;
         }
         if(this.var_1535)
         {
            return;
         }
         if(this.hasCompletedQuestWindowsOpen())
         {
            return;
         }
         if(this.var_110 != null && this.var_110.visible)
         {
            return;
         }
         var _loc2_:String = this.resolveDefaultCampaignCode();
         if(_loc2_ == "")
         {
            return;
         }
         var _loc3_:QuestCampaign = this.var_109[_loc2_];
         if(_loc3_.quests == null || _loc3_.quests.length == 0)
         {
            this.var_1978 = true;
            this.var_65.getQuestCampaign(_loc2_);
            return;
         }
         var _loc4_:Quest = this.findFirstAvailableQuestFromQuestCampaign(_loc3_);
         if(_loc4_ == null)
         {
            return;
         }
         this.showQuestReminder(_loc3_,_loc4_);
      }
      
      private function showQuestReminder(param1:QuestCampaign, param2:Quest) : void
      {
         var _loc3_:* = null;
         if(this.var_110 != null)
         {
            _loc3_ = this.var_110.rectangle;
            this.var_110.dispose();
            this.var_110 = null;
         }
         this.var_110 = IWindowContainer(this.var_65.getXmlWindow("QuestReminder"));
         this.var_110.findChildByTag("close").procedure = this.onReminderWindowClose;
         if(_loc3_ != null)
         {
            this.var_110.x = _loc3_.x;
            this.var_110.y = _loc3_.y;
         }
         else
         {
            this.var_110.center();
         }
         var _loc4_:IWindowContainer = IWindowContainer(this.var_110.findChildByName("quest.container"));
         _loc4_.removeChildAt(0);
         if(this.var_280)
         {
            this.var_280.dispose();
            this.var_280 = null;
         }
         this.var_280 = new QuestView(param1,param2,true);
         _loc4_.addChild(this.var_280.view);
         this.var_280.init();
         this.var_110.height = param2.type == "FIND_STUFF" ? 453 : 390;
         this.var_110.visible = true;
      }
      
      private function findFirstAvailableQuestFromQuestDatas(param1:QuestCampaign, param2:Array) : Quest
      {
         var _loc3_:* = null;
         param1.sortQuestDatas(param2);
         for each(_loc3_ in param2)
         {
            if(this.isAcceptedStatus(_loc3_.status))
            {
               return new Quest(_loc3_,param1);
            }
         }
         return null;
      }
      
      private function findFirstAvailableQuestFromQuestCampaign(param1:QuestCampaign) : Quest
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1.quests)
         {
            if(this.isAcceptedStatus(_loc2_.status))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function isAcceptedStatus(param1:int) : Boolean
      {
         return param1 == QuestStatusEnum.const_46 || param1 == QuestStatusEnum.const_345;
      }
      
      private function hasCompletedQuestWindowsOpen() : Boolean
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_109)
         {
            if(_loc1_.hasCompletedQuestWindowsOpen())
            {
               return true;
            }
         }
         return false;
      }
      
      private function onReminderWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.var_110.visible = false;
            this.var_1535 = true;
         }
      }
      
      public function onQuestCompletedDialogClose() : void
      {
         if(this.var_1262 == null)
         {
            return;
         }
         this.var_1535 = false;
         this.onReminderTimer(null);
      }
      
      private function refreshTabs() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc1_:ITabContextWindow = this._window.findChildByName("campaigns") as ITabContextWindow;
         for each(_loc4_ in this.var_109.getKeys())
         {
            _loc3_ = this.var_109[_loc4_];
            _loc2_ = _loc1_.getTabItemByName("tab_" + _loc4_);
            if(!_loc2_)
            {
               _loc6_ = "quest_" + _loc4_ + ".tab";
               _loc2_ = this.var_65.windowManager.createWindow("tab_" + _loc4_,"${" + _loc6_ + "}",WindowType.const_445) as ITabButtonWindow;
               if(_loc3_.expired)
               {
                  _loc1_.addTabItem(_loc2_);
               }
               else
               {
                  _loc1_.addTabItemAt(_loc2_,0);
               }
               _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onTabClick);
            }
            _loc5_ = 4287150640;
            if(_loc3_.expired)
            {
               _loc2_.color = 4286611584;
            }
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.close();
         }
      }
      
      private function onTabSelect(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(!param2)
         {
            param2 = param1.target as IWindow;
         }
         var _loc3_:String = param2.name.replace("tab_","");
         Logger.log("Tab select: " + _loc3_ + " " + param2.caption);
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow = null) : void
      {
         if(!param2)
         {
            param2 = param1.target as IWindow;
         }
         var _loc3_:String = param2.name.replace("tab_","");
         Logger.log("Tab click: " + _loc3_ + " " + param2.caption);
         this.var_65.getQuestCampaign(_loc3_);
      }
   }
}
