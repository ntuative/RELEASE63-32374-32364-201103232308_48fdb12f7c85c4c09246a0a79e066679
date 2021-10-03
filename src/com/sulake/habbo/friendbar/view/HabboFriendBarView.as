package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.FriendStruct;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDAvatarRenderManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_337:int = 127;
      
      private static const const_428:int = 40;
      
      private static const const_1000:int = -1;
      
      private static const const_1414:int = 0;
      
      private static const const_339:int = 1;
      
      private static const const_1417:int = -4;
      
      private static const const_1004:int = 80;
      
      private static const const_1424:Boolean = false;
      
      private static const const_1412:String = "bar_xml";
      
      private static const const_1421:String = "entity_xml";
      
      private static const const_1422:String = "facebook_piece_xml";
      
      private static const const_1415:String = "controls_piece_xml";
      
      private static const const_1420:String = "toggle_xml";
      
      private static const const_123:String = "list";
      
      private static const const_1002:String = "header";
      
      private static const const_1003:String = "facebook";
      
      private static const const_999:String = "controls";
      
      private static const const_338:String = "canvas";
      
      private static const const_427:String = "name";
      
      private static const const_988:String = "btn_message";
      
      private static const const_1005:String = "btn_visit";
      
      private static const const_1418:String = "icon";
      
      private static const const_1001:String = "button_left";
      
      private static const const_998:String = "button_right";
      
      private static const const_1413:String = "button_left_page";
      
      private static const const_1425:String = "button_right_page";
      
      private static const const_1419:String = "button_left_end";
      
      private static const const_1416:String = "button_right_end";
      
      private static const const_1423:String = "button_close";
      
      private static const const_1411:String = "button_open";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1113:IAvatarRenderManager;
      
      private var var_101:IHabboFriendBarData;
      
      private var var_29:IWindowContainer;
      
      private var var_213:IWindowContainer;
      
      private var var_669:Array;
      
      private var var_1257:Map;
      
      private var _startIndex:int = 0;
      
      private var var_458:int = -1;
      
      private var var_1258:TextCropper;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1258 = new TextCropper();
         this.var_669 = [];
         this.var_1257 = new Map();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            this._windowManager.getWindowContext(const_339).getDesktopWindow().removeEventListener(WindowEvent.const_47,this.onDesktopResized);
            if(this.var_213)
            {
               this.var_213.dispose();
               this.var_213 = null;
            }
            if(this.var_29)
            {
               this.var_29.dispose();
               this.var_29 = null;
            }
            while(this.var_669.length > 0)
            {
               this.var_669.pop().dispose();
            }
            while(this.var_1257.length > 0)
            {
               try
               {
                  BitmapData(this.var_1257.remove(this.var_1257.getKey(0))).dispose();
               }
               catch(e:Error)
               {
               }
            }
            if(this.var_101)
            {
               this.var_101.events.removeEventListener(FriendBarUpdateEvent.const_526,this.onRefreshView);
               this.var_101 = null;
               release(new IIDHabboFriendBarData());
            }
            if(this._windowManager)
            {
               this._windowManager = null;
               release(new IIDHabboWindowManager());
            }
            if(this.var_1113)
            {
               this.var_1113 = null;
               release(new IIDAvatarRenderManager());
            }
            this.var_1258.dispose();
            this.var_1258 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_29)
         {
            this.var_29.visible = param1;
            this.var_29.activate();
         }
         if(this.var_213)
         {
            this.var_213.visible = !param1;
            if(this.var_29)
            {
               this.var_213.x = this.var_29.x;
               this.var_213.y = this.var_29.y;
               this.var_213.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_29 && this.var_29.visible;
      }
      
      public function populate() : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc1_:IItemListWindow = this.var_29.findChildByName(const_123) as IItemListWindow;
         _loc1_.autoArrangeItems = false;
         var _loc2_:int = _loc1_.numListItems;
         _loc3_ = _loc2_;
         while(_loc3_ > 0)
         {
            this.releaseEntityWindow(_loc1_.removeListItemAt(_loc3_ - 1) as IWindowContainer);
            _loc3_--;
         }
         _loc2_ = Math.min(this.maxNumFriendsVisible,this.var_101.numFriends);
         this.visible = _loc2_ > 0;
         if(this._startIndex + _loc2_ > this.var_101.numFriends)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc2_ - this.var_101.numFriends));
         }
         _loc3_ = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = this.var_101.getFriendAt(_loc3_ + this._startIndex);
            _loc5_ = this.getEntityWindow();
            _loc5_.id = _loc4_.id;
            if(_loc4_.id == this.var_458)
            {
               _loc8_ = _loc4_;
               _loc9_ = _loc5_;
            }
            _loc6_ = IItemListWindow(_loc5_.getChildByName(const_123)).getListItemByName(const_1002) as IWindowContainer;
            _loc6_.getChildByName(const_427).caption = _loc4_.name;
            this.var_1258.crop(_loc6_.getChildByName(const_427) as ITextWindow);
            _loc7_ = IBitmapWrapperWindow(_loc6_.getChildByName(const_338));
            _loc7_.bitmap = this.getAvatarFaceBitmap(_loc4_.figure);
            _loc7_.width = _loc7_.bitmap.width;
            _loc7_.height = _loc7_.bitmap.height;
            _loc5_.y = 0;
            _loc1_.addListItem(_loc5_);
            _loc3_++;
         }
         _loc1_.autoArrangeItems = true;
         this.deSelectFriendEntity();
         if(_loc8_ && _loc9_)
         {
            this.selectFriendEntity(_loc8_,_loc9_);
         }
         this.toggleArrowButtons(this.maxNumFriendsVisible < this.var_101.numFriends);
      }
      
      public function addOrReplaceFriend(param1:FriendStruct) : void
      {
         var _loc2_:* = null;
         if(this.var_29)
         {
            _loc2_ = this.var_29.findChildByName(const_123) as IItemListWindow;
         }
      }
      
      private function get maxNumFriendsVisible() : int
      {
         var _loc1_:IItemListWindow = this.var_29.findChildByName(const_123) as IItemListWindow;
         return _loc1_.width / (const_337 + _loc1_.spacing);
      }
      
      private function getEntityWindow() : IWindowContainer
      {
         return this.var_669.length > 0 ? this.var_669.pop() : this.allocateEntityWindow();
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = this._windowManager.buildFromXML(assets.getAssetByName(const_1421).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_338));
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = const_337;
         _loc1_.height = const_428;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onFriendEntityClick);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.findChildByName(const_338).removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onFriendEntityClick);
            param1.width = const_337;
            param1.height = const_428;
            _loc2_ = IBitmapWrapperWindow(param1.findChildByName(const_338));
            _loc2_.bitmap = null;
            this.purgeEntityPieces(param1);
            if(this.var_669.indexOf(param1) == -1)
            {
               this.var_669.push(param1);
            }
         }
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_101 = param2 as IHabboFriendBarData;
         this.var_101.events.addEventListener(FriendBarUpdateEvent.const_526,this.onRefreshView);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_29 && !this.var_29.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < const_1414)
         {
            this.var_669.push(this.allocateEntityWindow());
            _loc1_++;
         }
         var _loc2_:IAsset = assets.getAssetByName(const_1412);
         this.var_29 = this._windowManager.buildFromXML(_loc2_.content as XML,const_339) as IWindowContainer;
         if(const_1000 > 0)
         {
            this.var_29.width = const_1000;
         }
         else
         {
            this.var_29.width = this.calculateSizeForBar();
         }
         this.var_29.x = this.var_29.parent.width / 2 - this.var_29.width / 2;
         this.var_29.y = this.var_29.parent.height - (this.var_29.height + const_1417);
         this.var_29.setParamFlag(WindowParam.const_266,true);
         this.var_29.procedure = this.barWindowEventProc;
         if(const_1424)
         {
            _loc2_ = assets.getAssetByName(const_1420);
            this.var_213 = this._windowManager.buildFromXML(_loc2_.content as XML,const_339) as IWindowContainer;
            this.var_213.x = this.var_29.x;
            this.var_213.y = this.var_29.y;
            this.var_213.setParamFlag(WindowParam.const_266,true);
            this.var_213.visible = false;
            this.var_213.procedure = this.toggleWindowEventProc;
         }
         this.visible = true;
         this._windowManager.getWindowContext(const_339).getDesktopWindow().addEventListener(WindowEvent.const_47,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_1113 = param2 as IAvatarRenderManager;
      }
      
      private function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:* = null;
         if(this.var_1113)
         {
            _loc3_ = this.var_1113.createAvatarImage(param1,AvatarScaleType.const_53,null,this);
            if(_loc3_)
            {
               _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_50);
               _loc3_.dispose();
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_29.findChildByName(const_123) as IItemListWindow;
         var _loc4_:int = this.var_101.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_101.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  this.var_1257[_loc2_.figure] = _loc6_;
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(const_123) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_1002));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.getChildByName(const_338) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_.clone();
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendEntitySelected(param1:IFriendEntity) : Boolean
      {
         return this.var_458 == param1.id;
      }
      
      private function selectFriendEntity(param1:IFriendEntity, param2:IWindowContainer) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(this.var_458 == param1.id)
         {
            return;
         }
         if(this.var_458 > -1)
         {
            this.deSelectFriendEntity();
         }
         this.var_458 = param1.id;
         var _loc3_:IItemListWindow = IItemListWindow(param2.getChildByName(const_123));
         if(param1.realName != null && param1.realName != "")
         {
            _loc4_ = this._windowManager.buildFromXML(assets.getAssetByName(const_1422).content as XML) as IWindowContainer;
            _loc4_.name = const_1003;
            _loc4_.getChildByName(const_427).caption = param1.realName;
            this.var_1258.crop(_loc4_.getChildByName(const_427) as ITextWindow);
            _loc5_ = IBitmapWrapperWindow(_loc4_.getChildByName(const_1418));
            _loc5_.bitmap = assets.getAssetByName(_loc5_.bitmapAssetName).content as BitmapData;
            _loc5_.width = _loc5_.bitmap.width;
            _loc5_.height = _loc5_.bitmap.height;
            _loc3_.addListItem(_loc4_);
         }
         if(param1.online)
         {
            _loc4_ = this._windowManager.buildFromXML(assets.getAssetByName(const_1415).content as XML) as IWindowContainer;
            _loc4_.name = const_999;
            _loc6_ = _loc4_.getChildByName(const_988);
            if(_loc6_)
            {
               _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onControlClick);
            }
            _loc6_ = _loc4_.getChildByName(const_1005);
            if(_loc6_)
            {
               if(param1.allowFollow)
               {
                  _loc6_.visible = true;
                  _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onControlClick);
               }
               else
               {
                  _loc6_.visible = false;
               }
            }
            _loc3_.addListItem(_loc4_);
         }
         param2.height = _loc3_.height;
         param2.y = const_428 - param2.height;
      }
      
      private function deSelectFriendEntity() : void
      {
         var _loc1_:* = null;
         if(this.var_458 > -1)
         {
            if(this.var_29)
            {
               _loc1_ = IItemListWindow(this.var_29.getChildByName(const_123)).getListItemByID(this.var_458) as IWindowContainer;
               if(_loc1_)
               {
                  this.purgeEntityPieces(_loc1_);
               }
            }
            this.var_458 = -1;
         }
      }
      
      private function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(const_123));
         _loc3_ = _loc2_.getListItemByName(const_1003) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_999) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         param1.height = const_428;
         param1.y = 0;
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate();
      }
      
      private function onFriendEntityClick(param1:WindowMouseEvent) : void
      {
         var _loc2_:int = param1.target.id;
         var _loc3_:IFriendEntity = this.var_101.getFriendByID(_loc2_);
         if(this.isFriendEntitySelected(_loc3_))
         {
            this.deSelectFriendEntity();
         }
         else
         {
            this.selectFriendEntity(_loc3_,param1.target as IWindowContainer);
         }
      }
      
      private function onControlClick(param1:WindowMouseEvent) : void
      {
         switch(param1.window.name)
         {
            case const_988:
               if(this.var_101)
               {
                  this.var_101.startConversation(this.var_458);
               }
               break;
            case const_1005:
               if(this.var_101)
               {
                  this.var_101.followToRoom(this.var_458);
               }
         }
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_DOWN)
         {
            _loc3_ = this._startIndex;
            switch(param2.name)
            {
               case const_1001:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1413:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumFriendsVisible);
                  break;
               case const_1419:
                  _loc3_ = 0;
                  break;
               case const_998:
                  _loc3_ = Math.max(0,Math.min(this.var_101.numFriends - this.maxNumFriendsVisible,this._startIndex + 1));
                  break;
               case const_1425:
                  _loc3_ = Math.max(0,Math.min(this.var_101.numFriends - this.maxNumFriendsVisible,this._startIndex + this.maxNumFriendsVisible));
                  break;
               case const_1416:
                  _loc3_ = Math.max(0,this.var_101.numFriends - this.maxNumFriendsVisible);
                  break;
               case const_1423:
                  this.visible = false;
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelectFriendEntity();
               this._startIndex = _loc3_;
               this.resizeAndPopulate();
            }
         }
         if(param1.type == WindowEvent.const_495)
         {
            this.deSelectFriendEntity();
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_213.visible)
         {
            if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_DOWN)
            {
               switch(param2.name)
               {
                  case const_1411:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean) : void
      {
         this.var_29.findChildByName(const_998).visible = param1;
         this.var_29.findChildByName(const_1001).visible = param1;
      }
      
      private function resizeAndPopulate() : void
      {
         if(!disposed)
         {
            if(this.var_29)
            {
               this.var_29.width = this.calculateSizeForBar();
               this.var_29.x = Math.max(this.var_29.parent.width / 2 - this.var_29.width / 2,const_1004);
               this.populate();
            }
         }
      }
      
      private function calculateSizeForBar() : int
      {
         var _loc1_:IItemListWindow = this.var_29.findChildByName(const_123) as IItemListWindow;
         var _loc2_:int = this._windowManager.getWindowContext(const_339).getDesktopWindow().width - const_1004;
         var _loc3_:int = this.var_29.width - _loc1_.width;
         var _loc4_:int = (_loc2_ - _loc3_) / (const_337 + _loc1_.spacing);
         return Math.min(_loc4_,this.var_101.numFriends) * (const_337 + _loc1_.spacing) + _loc3_;
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate();
      }
   }
}
