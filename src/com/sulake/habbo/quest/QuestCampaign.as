package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import com.sulake.habbo.quest.enum.QuestStatusEnum;
   import com.sulake.habbo.window.utils.IConfirmDialog;
   import flash.events.Event;
   
   public class QuestCampaign implements IDisposable
   {
       
      
      private var _controller:QuestController;
      
      private var var_1838:String;
      
      private var _activityPointType:int;
      
      private var var_320:Array;
      
      private var var_515:Quest;
      
      private var var_209:QuestView;
      
      private var var_2568:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_167:IWindowContainer;
      
      private var var_1447:IWindowContainer;
      
      private var var_319:IItemListWindow;
      
      private var var_516:Array;
      
      private var var_691:Boolean = false;
      
      private var var_772:IWindowContainer;
      
      private var var_1173:IRegionWindow;
      
      private var var_132:QuestHelp;
      
      private var var_1172:Boolean = false;
      
      public function QuestCampaign(param1:QuestController, param2:String)
      {
         this.var_320 = [];
         this.var_516 = [];
         super();
         this._controller = param1;
         this.var_1838 = param2;
         this.var_132 = new QuestHelp(this);
      }
      
      public function set activityPointType(param1:int) : void
      {
         this._activityPointType = param1;
      }
      
      public function get expired() : Boolean
      {
         return this.var_2568;
      }
      
      public function set expired(param1:Boolean) : void
      {
         this.var_2568 = param1;
      }
      
      public function get window() : IWindowContainer
      {
         return this._window;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         this.reset();
         if(this.var_209)
         {
            this.var_209.dispose();
            this.var_209 = null;
         }
         for each(_loc1_ in this.var_516)
         {
            _loc1_.dispose();
         }
         this.var_516 = [];
         this._window.dispose();
         this._window = null;
         this.var_691 = true;
         if(this.var_132)
         {
            this.var_132.dispose();
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_691;
      }
      
      private function reset() : void
      {
         var _loc1_:* = null;
         if(this.var_320)
         {
            for each(_loc1_ in this.var_320)
            {
               this.var_319.removeListItem(_loc1_.view);
               _loc1_.dispose();
            }
            this.var_320 = null;
            this.var_319.destroyListItems();
            this.var_319.removeListItems();
         }
         this.var_515 = null;
      }
      
      private function prepareWindow() : void
      {
         if(this._window != null)
         {
            this._window.visible = true;
            return;
         }
         this._window = IWindowContainer(this._controller.questEngine.getXmlWindow("QuestCampaign"));
         this.var_167 = this._window.findChildByName("quest.container") as IWindowContainer;
         this.var_1447 = this._window.findChildByName("currency.container") as IWindowContainer;
         this.var_319 = this._window.findChildByName("quests") as IItemListWindow;
         var _loc1_:* = "icon_" + this.code + "_pixeltype";
         var _loc2_:IBitmapWrapperWindow = this.var_1447.findChildByName("currency.icon") as IBitmapWrapperWindow;
         this._controller.questEngine.setImageFromAsset(_loc2_,_loc1_,this.onPreviewImageReady);
         this.var_1447.findChildByName("currency.amount").caption = "${quest_" + this.var_1838 + ".currency}";
         var _loc3_:String = "quest_" + this.code;
         var _loc4_:* = _loc3_ + ".title";
         var _loc5_:* = _loc3_ + ".currency";
         this.setText("currency.amount",_loc5_);
         this.var_772 = this._window.findChildByName("help.button") as IWindowContainer;
         this.var_1173 = this._window.findChildByName("help.container") as IRegionWindow;
         if(this.var_1173)
         {
            this.var_1173.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.helpButtonEventProc);
            this.var_1173.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.helpButtonEventProc);
            this.var_1173.addEventListener(WindowMouseEvent.const_25,this.helpButtonEventProc);
         }
         if(this.var_772)
         {
            this.var_772.color = 14737632;
         }
      }
      
      public function attachTo(param1:IWindowContainer) : void
      {
         if(this.var_691 || !this._window)
         {
            return;
         }
         param1.addChild(this._window);
         this._window.x = 0;
         this._window.y = 0;
         this._window.width = param1.width;
         this._window.height = param1.height;
         if(this.var_167)
         {
            this.var_167.height = this._window.height - this.var_167.y * 2;
            if(this.var_209)
            {
               this.var_209.view.height = this.var_167.height;
            }
         }
      }
      
      private function helpButtonEventProc(param1:Event, param2:IWindow = null) : void
      {
         if(param2 == null)
         {
            param2 = param1.target as IWindow;
         }
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.openHelp();
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            if(!this.var_1172)
            {
               this.var_772.color = 6710886;
            }
         }
         else if(param1.type == WindowMouseEvent.const_25)
         {
            if(!this.var_1172)
            {
               this.var_772.color = 14737632;
            }
         }
      }
      
      private function closeHelp() : void
      {
         this.var_1172 = false;
         this.var_772.color = 14737632;
      }
      
      private function openHelp() : void
      {
         Logger.log("Open Questing Help System");
         this.var_1172 = true;
         this.var_772.color = 6710886;
         this.var_167.removeChildAt(0);
         if(this.var_209)
         {
            this.var_209.dispose();
            this.var_209 = null;
         }
         if(this.var_515)
         {
            this.var_515.selected = false;
         }
         if(this.var_132)
         {
            this.var_167.addChild(this.var_132.view);
         }
         if(this.var_167)
         {
            this.var_167.height = this._window.height - this.var_167.y * 2;
            if(this.var_132.view)
            {
               this.var_132.view.height = this.var_167.height;
            }
         }
      }
      
      public function updatePurse() : void
      {
         var _loc1_:int = this._controller.questEngine.getActivityPointsForType(this._activityPointType);
         this._controller.questEngine.localization.registerParameter("quest_" + this.code + ".currency","amount",_loc1_.toString());
      }
      
      private function onPreviewImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         if(this.var_691)
         {
            return;
         }
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this._window)
         {
            return;
         }
         if(_loc2_ != null)
         {
            _loc3_ = this.var_1447.findChildByName("currency.icon") as IBitmapWrapperWindow;
            this._controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onPreviewImageReady);
         }
      }
      
      public function get controller() : QuestController
      {
         return this._controller;
      }
      
      public function openCampaign(param1:Array) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         this.prepareWindow();
         this.reset();
         this.updatePurse();
         this.sortQuestDatas(param1);
         this.var_320 = [];
         for each(_loc2_ in param1)
         {
            this.var_320.push(new Quest(_loc2_,this));
         }
         _loc3_ = null;
         for each(_loc4_ in this.var_320)
         {
            this.var_319.addListItem(_loc4_.view);
            if(!_loc3_ && (_loc4_.status == QuestStatusEnum.const_46 || _loc4_.status == QuestStatusEnum.const_345))
            {
               _loc3_ = _loc4_;
            }
         }
         if(_loc3_)
         {
            this.activateListItem(_loc3_);
            if(this.var_319.maxScrollV > 0)
            {
               this.var_319.scrollV = _loc3_.view.y / this.var_319.maxScrollV;
            }
         }
         else if(this.var_320.length > 0)
         {
            this.activateListItem(this.var_320[0]);
         }
      }
      
      public function sortQuestDatas(param1:Array) : void
      {
         if(this.hasSortOrder(param1))
         {
            param1.sort(this.orderByOrder,Array.NUMERIC);
         }
         else
         {
            param1.sort(this.orderByName,Array.NUMERIC);
         }
      }
      
      private function hasSortOrder(param1:Array) : Boolean
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            if(_loc2_.sortOrder != 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function orderByName(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.localizationPrefix;
         var _loc4_:String = param2.localizationPrefix;
         var _loc5_:uint = param1.sortCode;
         var _loc6_:uint = param2.sortCode;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         if(_loc5_ > _loc6_)
         {
            return 1;
         }
         if(_loc5_ < _loc6_)
         {
            return -1;
         }
         return this.sortByDate(param1,param2);
      }
      
      private function sortByDate(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:Number = Number(param1.endDateTimeStamp);
         var _loc4_:Number = Number(param2.endDateTimeStamp);
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      private function orderByOrder(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:uint = param1.sortOrder;
         var _loc4_:uint = param2.sortOrder;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return this.sortByDate(param1,param2);
      }
      
      private function orderByDate(param1:QuestMessageData, param2:QuestMessageData) : Number
      {
         var _loc3_:String = param1.endDateTimeStamp;
         var _loc4_:String = param2.endDateTimeStamp;
         if(_loc3_ > _loc4_)
         {
            return 1;
         }
         if(_loc3_ < _loc4_)
         {
            return -1;
         }
         return 0;
      }
      
      public function get code() : String
      {
         return this.var_1838;
      }
      
      public function updateListView() : void
      {
         var _loc1_:IItemListWindow = this._window.findChildByName("quests") as IItemListWindow;
         _loc1_.invalidate();
      }
      
      public function activateListItem(param1:Quest) : void
      {
         if(this.var_1172)
         {
            this.closeHelp();
         }
         if(this.var_515 != null)
         {
            this.var_515.selected = false;
         }
         this.var_515 = param1;
         this.var_515.selected = true;
         this.showQuestData(this.var_515);
      }
      
      private function showQuestData(param1:Quest) : void
      {
         if(!this.var_167)
         {
            return;
         }
         this.var_167.removeChildAt(0);
         if(this.var_209)
         {
            this.var_209.dispose();
            this.var_209 = null;
         }
         this.var_209 = new QuestView(this,param1);
         this.var_167.addChild(this.var_209.view);
         this.var_209.init();
         this.var_167.height = this._window.height - this.var_167.y * 2;
         this.var_209.view.height = this.var_167.height;
      }
      
      public function questAccepted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
      }
      
      public function questCompleted(param1:QuestMessageData) : void
      {
         this.modifyQuestData(param1);
         this.var_516.push(new QuestCompleted(this,param1));
      }
      
      public function closeQuestCompleted(param1:QuestCompleted) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         for each(_loc3_ in this.var_516)
         {
            if(_loc3_ == param1)
            {
               _loc2_ = _loc3_;
               break;
            }
         }
         if(_loc2_)
         {
            _loc2_.dispose();
            _loc4_ = this.var_516.indexOf(_loc2_);
            if(_loc4_ >= 0)
            {
               this.var_516.splice(_loc4_,1);
            }
         }
      }
      
      public function hasCompletedQuestWindowsOpen() : Boolean
      {
         return this.var_516 != null && this.var_516.length > 0;
      }
      
      private function modifyQuestData(param1:QuestMessageData) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc3_:int = 0;
         for each(_loc4_ in this.var_320)
         {
            if(_loc4_.id == param1.id)
            {
               _loc2_ = _loc4_;
               break;
            }
            _loc3_++;
         }
         if(_loc2_)
         {
            _loc5_ = new Quest(param1,this);
            this.var_320[_loc3_] = _loc5_;
            _loc6_ = this.var_319.getListItemIndex(_loc2_.view);
            this.var_319.removeListItem(_loc2_.view);
            if(_loc6_ > -1)
            {
               this.var_319.addListItemAt(_loc5_.view,_loc6_);
            }
            else
            {
               this.var_319.addListItem(_loc5_.view);
            }
            if(this.var_515 == _loc2_)
            {
               this.activateListItem(_loc5_);
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
      }
      
      private function onConfirm(param1:IConfirmDialog, param2:Event) : void
      {
         param1.dispose();
      }
      
      public function find(param1:String) : IWindow
      {
         var _loc2_:* = null;
         if(this._window is IWindowContainer)
         {
            _loc2_ = IWindowContainer(this._window).findChildByName(param1);
         }
         else if(this._window is IItemListWindow)
         {
            _loc2_ = IItemListWindow(this._window).getListItemByName(param1);
         }
         if(_loc2_ == null)
         {
            throw new Error("Window element with name: " + param1 + " cannot be found!");
         }
         return _loc2_;
      }
      
      private function setText(param1:String, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:IWindow = this.find(param1);
         if(_loc4_)
         {
            if(param3)
            {
               param2 = "${" + param2 + "}";
            }
            _loc4_.caption = param2;
         }
      }
      
      public function get quests() : Array
      {
         return this.var_320;
      }
   }
}
