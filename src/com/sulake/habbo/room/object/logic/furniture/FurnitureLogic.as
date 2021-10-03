package com.sulake.habbo.room.object.logic.furniture
{
   import com.sulake.habbo.room.events.RoomObjectRoomAdEvent;
   import com.sulake.habbo.room.events.RoomObjectStateChangeEvent;
   import com.sulake.habbo.room.messages.RoomObjectDataUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectItemDataUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.room.object.logic.MovingObjectLogic;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.XMLValidator;
   import flash.events.MouseEvent;
   
   public class FurnitureLogic extends MovingObjectLogic
   {
       
      
      private var var_1112:Boolean = false;
      
      private var var_488:Number = 0.0;
      
      private var var_585:Number = 0.0;
      
      private var var_1387:Number = 0.0;
      
      private var var_2377:Number = 0.0;
      
      private var var_2378:Number = 0.0;
      
      private var var_1738:Number = 0.0;
      
      private var var_270:Array;
      
      public function FurnitureLogic()
      {
         this.var_270 = [];
         super();
      }
      
      override public function getEventTypes() : Array
      {
         var _loc1_:Array = [RoomObjectRoomAdEvent.const_278,RoomObjectRoomAdEvent.const_279,RoomObjectRoomAdEvent.const_512,RoomObjectStateChangeEvent.const_97,RoomObjectMouseEvent.const_144,RoomObjectRoomAdEvent.const_267,RoomObjectMouseEvent.ROOM_OBJECT_MOUSE_DOWN];
         return getAllEventTypes(super.getEventTypes(),_loc1_);
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_270 = null;
      }
      
      override public function initialize(param1:XML) : void
      {
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1 == null)
         {
            return;
         }
         this.var_488 = 0;
         this.var_585 = 0;
         this.var_1387 = 0;
         this.var_270 = [];
         var _loc2_:XMLList = param1.model.dimensions;
         if(_loc2_.length() == 0)
         {
            return;
         }
         var _loc3_:XMLList = _loc2_.@x;
         if(_loc3_.length() == 1)
         {
            this.var_488 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@y;
         if(_loc3_.length() == 1)
         {
            this.var_585 = Number(_loc3_);
         }
         _loc3_ = _loc2_.@z;
         if(_loc3_.length() == 1)
         {
            this.var_1387 = Number(_loc3_);
         }
         this.var_2377 = this.var_488 / 2;
         this.var_2378 = this.var_585 / 2;
         _loc3_ = _loc2_.@centerZ;
         if(_loc3_.length() == 1)
         {
            this.var_1738 = Number(_loc3_);
         }
         else
         {
            this.var_1738 = this.var_1387 / 2;
         }
         var _loc4_:XMLList = param1.model.directions.direction;
         var _loc5_:* = ["id"];
         var _loc6_:int = 0;
         while(_loc6_ < _loc4_.length())
         {
            _loc7_ = _loc4_[_loc6_];
            if(XMLValidator.checkRequiredAttributes(_loc7_,_loc5_))
            {
               _loc8_ = parseInt(_loc7_.@id);
               this.var_270.push(_loc8_);
            }
            _loc6_++;
         }
         this.var_270.sort(Array.NUMERIC);
         if(object == null || object.getModelController() == null)
         {
            return;
         }
         object.getModelController().setNumber(RoomObjectVariableEnum.const_323,this.var_488,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_366,this.var_585,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_681,this.var_1387,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1525,this.var_2377,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1502,this.var_2378,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_1124,this.var_1738,true);
         object.getModelController().setNumberArray(RoomObjectVariableEnum.const_794,this.var_270,true);
         object.getModelController().setNumber(RoomObjectVariableEnum.const_282,1);
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(param1.type == MouseEvent.MOUSE_MOVE)
         {
            return;
         }
         if(object == null)
         {
            return;
         }
         var _loc3_:IRoomObjectModelController = object.getModel() as IRoomObjectModelController;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc7_:String = _loc3_.getString(RoomObjectVariableEnum.const_377);
         switch(param1.type)
         {
            case MouseEvent.ROLL_OVER:
               if(!this.var_1112)
               {
                  _loc4_ = object.getId();
                  _loc5_ = object.getType();
                  if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_278,_loc4_,_loc5_));
                  }
                  this.var_1112 = true;
               }
               break;
            case MouseEvent.ROLL_OUT:
               if(this.var_1112)
               {
                  _loc4_ = object.getId();
                  _loc5_ = object.getType();
                  if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
                  {
                     eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_279,_loc4_,_loc5_));
                  }
                  this.var_1112 = false;
               }
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc4_ = object.getId();
               _loc5_ = object.getType();
               if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_512,_loc4_,_loc5_));
               }
               if(eventDispatcher != null)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectStateChangeEvent(RoomObjectStateChangeEvent.const_97,_loc4_,_loc5_));
               }
               break;
            case MouseEvent.CLICK:
               _loc4_ = object.getId();
               _loc5_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc6_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.const_144,param1.eventId,_loc4_,_loc5_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc6_);
               }
               if(eventDispatcher != null && _loc7_ != null && _loc7_.indexOf("http") == 0)
               {
                  eventDispatcher.dispatchEvent(new RoomObjectRoomAdEvent(RoomObjectRoomAdEvent.const_267,_loc4_,_loc5_));
               }
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc4_ = object.getId();
               _loc5_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc6_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROOM_OBJECT_MOUSE_DOWN,param1.eventId,_loc4_,_loc5_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc6_);
               }
         }
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc2_:IRoomObjectModelController = object.getModelController();
         var _loc3_:RoomObjectDataUpdateMessage = param1 as RoomObjectDataUpdateMessage;
         if(_loc3_ != null)
         {
            object.setState(_loc3_.state,0);
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_85,_loc3_.data);
               if(!isNaN(_loc3_.extra))
               {
                  _loc2_.setString(RoomObjectVariableEnum.const_358,String(_loc3_.extra));
               }
               _loc2_.setNumber(RoomObjectVariableEnum.const_844,lastUpdateTime);
            }
            return;
         }
         var _loc4_:RoomObjectItemDataUpdateMessage = param1 as RoomObjectItemDataUpdateMessage;
         if(_loc4_ != null)
         {
            if(_loc2_ != null)
            {
               _loc2_.setString(RoomObjectVariableEnum.const_1155,_loc4_.itemData);
            }
            return;
         }
         this.var_1112 = false;
         super.processUpdateMessage(param1);
      }
   }
}
