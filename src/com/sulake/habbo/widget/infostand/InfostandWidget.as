package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.GivableBadgeData;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserGivableBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private const const_1783:String = "infostand_user_view";
      
      private const const_1781:String = "infostand_furni_view";
      
      private const const_1782:String = "infostand_pet_view";
      
      private const const_1780:String = "infostand_bot_view";
      
      private const const_1785:String = "infostand_jukebox_view";
      
      private const const_1784:String = "infostand_songdisk_view";
      
      private var var_1259:InfoStandFurniView;
      
      private var var_142:InfoStandUserView;
      
      private var var_388:InfoStandPetView;
      
      private var var_459:InfoStandBotView;
      
      private var var_1260:InfoStandJukeboxView;
      
      private var var_1261:InfoStandSongDiskView;
      
      private var var_2753:Array;
      
      private var var_1531:InfostandUserData;
      
      private var var_617:InfostandFurniData;
      
      private var _petData:InfoStandPetData;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_174:Timer;
      
      private var _config:IHabboConfigurationManager;
      
      private var _catalog:IHabboCatalog;
      
      private var var_512:IHabboSoundManager;
      
      private const const_2070:int = 3000;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog, param6:IHabboSoundManager)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_512 = param6;
         this.var_1259 = new InfoStandFurniView(this,this.const_1781,this._catalog);
         this.var_142 = new InfoStandUserView(this,this.const_1783);
         this.var_388 = new InfoStandPetView(this,this.const_1782,this._catalog);
         this.var_459 = new InfoStandBotView(this,this.const_1780);
         this.var_1260 = new InfoStandJukeboxView(this,this.const_1785,this._catalog,this.var_512);
         this.var_1261 = new InfoStandSongDiskView(this,this.const_1784,this._catalog,this.var_512);
         this.var_1531 = new InfostandUserData();
         this.var_617 = new InfostandFurniData();
         this._petData = new InfoStandPetData();
         this.var_174 = new Timer(this.const_2070);
         this.var_174.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_62,HabboWindowStyle.const_43,HabboWindowParam.const_43,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      public function getXmlWindow(param1:String) : IWindow
      {
         var asset:IAsset = null;
         var xmlAsset:XmlAsset = null;
         var name:String = param1;
         var window:IWindow = null;
         try
         {
            asset = assets.getAssetByName(name);
            xmlAsset = XmlAsset(asset);
            window = windowManager.buildFromXML(XML(xmlAsset.content));
         }
         catch(e:Error)
         {
            Logger.log("[InfoStandWidget] Missing window XML: " + name);
         }
         return window;
      }
      
      override public function dispose() : void
      {
         if(this.var_174)
         {
            this.var_174.stop();
         }
         this.var_174 = null;
         if(this.var_142)
         {
            this.var_142.dispose();
         }
         this.var_142 = null;
         if(this.var_1259)
         {
            this.var_1259.dispose();
         }
         this.var_1259 = null;
         if(this.var_459)
         {
            this.var_459.dispose();
         }
         this.var_459 = null;
         if(this.var_388)
         {
            this.var_388.dispose();
         }
         this.var_388 = null;
         if(this.var_1260)
         {
            this.var_1260.dispose();
         }
         this.var_1260 = null;
         if(this.var_1261)
         {
            this.var_1261.dispose();
         }
         this.var_1261 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_347,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_166,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_129,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_141,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_326,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_160,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_164,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_65,this.onUserBadges);
         param1.addEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_659,this.onUserGivableBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_839,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_347,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_166,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_129,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_141,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_326,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_160,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_164,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_65,this.onUserBadges);
         param1.removeEventListener(RoomWidgetUserGivableBadgesUpdateEvent.const_659,this.onUserGivableBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_839,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.PET_COMMANDS,this.onPetCommands);
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_1531;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_617;
      }
      
      public function get petData() : InfoStandPetData
      {
         return this._petData;
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_388 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_342,this.var_388.getCurrentPetId()));
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_142.update(param1);
         this.selectView(this.const_1783);
         if(this.var_174)
         {
            this.var_174.stop();
         }
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_459.update(param1);
         this.selectView(this.const_1780);
         if(this.var_174)
         {
            this.var_174.stop();
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         if(param1.extraParam == RoomWidgetEnum.const_1059)
         {
            this.var_1260.update(param1);
            this.selectView(this.const_1785);
         }
         else if(param1.extraParam.indexOf(RoomWidgetEnum.const_822) != -1)
         {
            this.var_1261.update(param1);
            this.selectView(this.const_1784);
         }
         else
         {
            this.var_1259.update(param1);
            this.selectView(this.const_1781);
         }
         if(this.var_174)
         {
            this.var_174.stop();
         }
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_388.update(this.petData);
         this.selectView(this.const_1782);
         if(this.var_174)
         {
            this.var_174.start();
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_388.updateEnabledTrainingCommands(param1.id,new CommandConfiguration(param1.allCommands,param1.enabledCommands));
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2753 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_142.setTags(param1.tags);
         }
         else
         {
            this.var_142.setTags(param1.tags,this.var_2753);
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_459.image = param1.image;
         }
         else
         {
            this.var_142.image = param1.image;
            this.var_142.setMotto(param1.customInfo,param1.isOwnUser);
            this.var_142.achievementScore = param1.achievementScore;
         }
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_142.clearBadges();
      }
      
      private function onUserGivableBadges(param1:RoomWidgetUserGivableBadgesUpdateEvent) : void
      {
         this.userData.givableBadges = param1.badges;
         this.var_142.updateGivableBadges();
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc6_:* = null;
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_459.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_142.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         for each(_loc6_ in this.userData.givableBadges)
         {
            if(param1.badgeID == _loc6_.achievementTypeName)
            {
               if(!this.userData.isBot())
               {
                  _loc4_.push(_loc5_);
               }
            }
            _loc5_++;
         }
         if(_loc4_.length > 0)
         {
            this.var_142.setGivableBadgeImage(_loc4_,param1.badgeImage);
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_142.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_378,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_129:
               _loc2_ = param1.id == this.var_617.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_166:
               if(this.var_142 != null && this.var_142.window != null && this.var_142.window.visible)
               {
                  _loc2_ = param1.id == this.var_1531.userRoomId;
                  break;
               }
               if(this.var_388 != null && this.var_388.window != null && this.var_388.window.visible)
               {
                  _loc2_ = param1.id == this._petData.roomIndex;
                  break;
               }
               if(this.var_459 != null && this.var_459.window != null && this.var_459.window.visible)
               {
                  _loc2_ = param1.id == this.var_1531.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_174)
         {
            this.var_174.stop();
         }
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_174)
         {
            this.var_174.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
   }
}
