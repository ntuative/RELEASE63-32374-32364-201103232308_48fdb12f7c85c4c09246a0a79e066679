package com.sulake.habbo.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_517:String = "RWTDUE_TEASER_DATA";
      
      public static const const_657:String = "RWTDUE_GIFT_DATA";
      
      public static const const_695:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_391:int;
      
      private var _data:String;
      
      private var var_401:int;
      
      private var var_186:String;
      
      private var var_2263:String;
      
      private var var_2265:Boolean;
      
      private var var_1429:int = 0;
      
      private var var_2264:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_391;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2263;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2265;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2264;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1429;
      }
      
      public function set status(param1:int) : void
      {
         this.var_401 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2263 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2265 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2264 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_391 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_186;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_186 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1429 = param1;
      }
   }
}
