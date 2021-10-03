package com.sulake.habbo.friendlist
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendlist.events.HabboFriendListTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.utils.Dictionary;
   
   public class FriendListView
   {
      
      private static const const_1790:String = "noconvinfo";
      
      private static const const_1789:String = "messageinput";
       
      
      private var _friendList:HabboFriendList;
      
      private var var_1542:FriendListTabsView;
      
      private var var_17:IFrameWindow;
      
      private var var_989:IWindowContainer;
      
      private var var_253:IWindowContainer;
      
      private var var_1541:ITextWindow;
      
      private var var_2007:int = -1;
      
      private var var_2005:int = -1;
      
      private var var_2006:Boolean;
      
      public function FriendListView(param1:HabboFriendList)
      {
         super();
         this._friendList = param1;
         this.var_1542 = new FriendListTabsView(this._friendList);
      }
      
      public function isFriendListOpen() : Boolean
      {
         return this.var_17 != null && this.var_17.visible;
      }
      
      public function openFriendList() : void
      {
         if(this.var_17 == null)
         {
            this.prepare();
            this._friendList.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_55,HabboToolbarIconEnum.FRIENDLIST,this.var_17));
         }
         else
         {
            this.var_17.visible = true;
            this.var_17.activate();
         }
      }
      
      public function showInfo(param1:WindowEvent, param2:String) : void
      {
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         if(_loc3_ == null)
         {
            return;
         }
         if(_loc3_.type == WindowMouseEvent.const_25)
         {
            this.var_1541.text = "";
         }
         else if(_loc3_.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            this.var_1541.text = param2;
         }
      }
      
      public function refresh(param1:String) : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         this.var_1542.refresh(param1);
         this.refreshWindowSize();
      }
      
      public function close() : void
      {
         if(this.var_17 != null)
         {
            this.var_17.visible = false;
         }
      }
      
      private function prepare() : void
      {
         this.var_17 = IFrameWindow(this._friendList.getXmlWindow("main_window"));
         this.var_17.findChildByTag("close").procedure = this.onWindowClose;
         this.var_989 = IWindowContainer(this.var_17.content.findChildByName("main_content"));
         this.var_253 = IWindowContainer(this.var_17.content.findChildByName("footer"));
         this.var_1542.prepare(this.var_989);
         this.var_17.procedure = this.onWindow;
         this.var_17.content.setParamFlag(HabboWindowParam.const_1173,false);
         this.var_17.content.setParamFlag(HabboWindowParam.const_1245,true);
         this.var_17.header.setParamFlag(HabboWindowParam.const_670,false);
         this.var_17.header.setParamFlag(HabboWindowParam.const_639,true);
         this.var_17.content.setParamFlag(HabboWindowParam.const_670,false);
         this.var_17.content.setParamFlag(HabboWindowParam.const_639,true);
         this.var_17.findChildByName("open_edit_ctgs_but").procedure = this.onEditCategoriesButtonClick;
         this.var_1541 = ITextWindow(this.var_17.findChildByName("info_text"));
         this.var_1541.text = "";
         this._friendList.refreshButton(this.var_17,"open_edit_ctgs",true,null,0);
         this.var_17.title.color = 4294623744;
         this.var_17.title.textColor = 4287851525;
         this.refresh("prepare");
         this.var_17.height = 350;
         this.var_17.width = 230;
      }
      
      private function getTitleBar() : IWindowContainer
      {
         return this.var_17.findChildByName("titlebar") as IWindowContainer;
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_17.visible = false;
         this._friendList.trackFriendListEvent(HabboFriendListTrackingEvent.HABBO_FRIENDLIST_TRACKIG_EVENT_CLOSED);
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_47 || param2 != this.var_17)
         {
            return;
         }
         if(this.var_2006)
         {
            return;
         }
         var _loc3_:int = this.var_2007 == -1 ? 0 : int(this.var_17.height - this.var_2007);
         var _loc4_:int = this.var_2005 == -1 ? 0 : int(this.var_17.width - this.var_2005);
         this._friendList.tabs.tabContentHeight = Math.max(100,this._friendList.tabs.tabContentHeight + _loc3_);
         this._friendList.tabs.windowWidth = Math.max(147,this._friendList.tabs.windowWidth + _loc4_);
         this.refresh("resize: " + _loc3_);
      }
      
      private function refreshWindowSize() : void
      {
         this.var_2006 = true;
         this.var_253.visible = false;
         this.var_253.y = Util.getLowestPoint(this.var_17.content);
         this.var_253.width = this._friendList.tabs.windowWidth;
         this.var_253.visible = true;
         this.var_17.content.height = Util.getLowestPoint(this.var_17.content);
         this.var_17.content.width = this._friendList.tabs.windowWidth - 10;
         this.var_17.header.width = this._friendList.tabs.windowWidth - 10;
         this.var_17.height = this.var_17.content.height + 30;
         this.var_17.width = this._friendList.tabs.windowWidth;
         this.var_2006 = false;
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_753,false);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_1061,this._friendList.tabs.findSelectedTab() != null);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_670,false);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_1173,false);
         this.var_17.scaler.x = this.var_17.width - this.var_17.scaler.width;
         this.var_17.scaler.y = this.var_17.height - this.var_17.scaler.height;
         this.var_2007 = this.var_17.height;
         this.var_2005 = this.var_17.width;
         Logger.log("RESIZED: " + this._friendList.tabs.windowWidth);
      }
      
      private function onEditCategoriesButtonClick(param1:WindowEvent, param2:IWindow) : void
      {
         this._friendList.view.showInfo(param1,"${friendlist.tip.preferences}");
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Edit categories clicked");
         var _loc3_:WindowMouseEvent = param1 as WindowMouseEvent;
         this._friendList.openHabboWebPage("link.format.friendlist.pref",new Dictionary(),_loc3_.stageX,_loc3_.stageY);
      }
      
      public function get mainWindow() : IWindowContainer
      {
         return this.var_17;
      }
      
      public function get tabsView() : FriendListTabsView
      {
         return this.var_1542;
      }
   }
}
