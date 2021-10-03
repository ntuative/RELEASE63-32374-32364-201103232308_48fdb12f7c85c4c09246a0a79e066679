package com.sulake.habbo.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
       
      
      private var var_23:Component;
      
      private var var_16:AvatarInfoView;
      
      private var var_197:Boolean = false;
      
      private var var_1884:Boolean = false;
      
      private var var_1220:Timer;
      
      private var var_2881:int = 3000;
      
      private var var_1490:Boolean;
      
      private var var_995:Boolean;
      
      private var var_801:Number;
      
      private var var_1491:int;
      
      private var var_2882:int = 500;
      
      public function AvatarInfoWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:Component)
      {
         super(param1,param2,param3);
         this.var_23 = param4;
         this.var_1490 = false;
         this.var_995 = false;
         this.var_1220 = new Timer(this.var_2881,1);
         this.var_1220.addEventListener(TimerEvent.TIMER_COMPLETE,this.onTimerComplete);
      }
      
      private function onTimerComplete(param1:TimerEvent) : void
      {
         this.var_995 = true;
         this.var_1491 = 0;
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_827,0,0));
      }
      
      override public function dispose() : void
      {
         if(disposed)
         {
            return;
         }
         if(this.var_23)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
         }
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_117,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_141,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_326,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_114,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_166,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_88,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_348,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_117,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_121,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_141,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_155,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_326,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_114,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_166,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_88,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_348,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_117:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_195,_loc2_.allowNameChange);
               this.var_197 = true;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_155:
            case RoomWidgetFurniInfoUpdateEvent.const_326:
               this.removeView();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_121:
               this.getOwnCharacterInfo();
               break;
            case RoomWidgetUserInfoUpdateEvent.const_141:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_195);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_870);
               break;
            case RoomWidgetPetInfoUpdateEvent.PET_INFO:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_186);
               break;
            case RoomWidgetUserDataUpdateEvent.const_114:
               if(!this.var_197)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_166:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this.var_16 && this.var_16.roomIndex == _loc6_.id)
               {
                  this.disposeView();
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_88:
               this.var_1884 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_348:
               this.var_1884 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean = false) : void
      {
         this.var_995 = false;
         if(this.var_1220.running)
         {
            this.var_1220.stop();
         }
         if(this.var_16 == null || this.var_16.userId != param1 || this.var_16.userName != param2 || this.var_16.roomIndex != param3 || this.var_16.userType != param4)
         {
            if(this.var_16)
            {
               this.disposeView();
            }
            if(!this.var_1884)
            {
               this.var_16 = new AvatarInfoView(this,param1,param2,param3,param4,param5);
            }
         }
      }
      
      public function disposeView() : void
      {
         if(this.var_16)
         {
            this.var_16.dispose();
            this.var_16 = null;
            this.var_1490 = true;
            this.var_995 = false;
         }
      }
      
      private function removeView() : void
      {
         if(!this.var_1490)
         {
            this.var_1490 = true;
            this.var_1220.start();
         }
         else if(!this.var_995)
         {
            this.disposeView();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_23)
         {
            return;
         }
         if(this.var_16)
         {
            this.var_23.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_23.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(!this.var_16)
         {
            return;
         }
         _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this.var_16.userId,this.var_16.userType)) as RoomWidgetUserLocationUpdateEvent;
         if(!_loc2_)
         {
            return;
         }
         if(this.var_995)
         {
            this.var_1491 += param1;
            this.var_801 = 1 - this.var_1491 / Number(this.var_2882);
         }
         else
         {
            this.var_801 = 1;
         }
         if(this.var_801 <= 0)
         {
            this.disposeView();
            return;
         }
         this.var_16.update(_loc2_.rectangle,this.var_801);
         this.checkUpdateNeed();
      }
   }
}
