package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var _offerId:int;
      
      private var _furniId:int;
      
      private var var_2292:int;
      
      private var var_2071:String;
      
      private var var_1666:int;
      
      private var var_401:int;
      
      private var var_2291:int = -1;
      
      private var var_2125:int;
      
      private var var_1665:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_2292 = param3;
         this.var_2071 = param4;
         this.var_1666 = param5;
         this.var_401 = param6;
         this.var_2291 = param7;
         this.var_2125 = param8;
         this.var_1665 = param9;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2292;
      }
      
      public function get stuffData() : String
      {
         return this.var_2071;
      }
      
      public function get price() : int
      {
         return this.var_1666;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2291;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2125;
      }
      
      public function get offerCount() : int
      {
         return this.var_1665;
      }
   }
}
