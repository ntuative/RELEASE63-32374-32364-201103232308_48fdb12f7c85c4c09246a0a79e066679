package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_326:String = "RWFIUE_FURNI";
       
      
      private var _id:int = 0;
      
      private var _category:int = 0;
      
      private var _name:String = "";
      
      private var var_1797:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_2772:Boolean = false;
      
      private var var_2773:Boolean = false;
      
      private var var_2019:Boolean = false;
      
      private var var_2021:Boolean = false;
      
      private var var_2348:Boolean = false;
      
      private var var_1920:int = -1;
      
      private var var_2227:int = -1;
      
      private var _offerId:int = -1;
      
      private var var_1497:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1797 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1797;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2772 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2772;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2773 = param1;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2773;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2019 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2019;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_2021 = param1;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_2021;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2348 = param1;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2348;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1920 = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1920;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2227 = param1;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2227;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function set extraParam(param1:String) : void
      {
         this.var_1497 = param1;
      }
      
      public function get extraParam() : String
      {
         return this.var_1497;
      }
   }
}
