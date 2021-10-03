package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.Purse;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var _offerId:int;
      
      private var var_1730:String;
      
      private var var_1666:int;
      
      private var var_2282:Boolean;
      
      private var var_2285:Boolean;
      
      private var var_2284:int;
      
      private var var_2280:int;
      
      private var var_435:ICatalogPage;
      
      private var var_2279:int;
      
      private var var_2283:int;
      
      private var var_2281:int;
      
      private var var_2373:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1730 = param2;
         this.var_1666 = param3;
         this.var_2282 = param4;
         this.var_2285 = param5;
         this.var_2284 = param6;
         this.var_2280 = param7;
         this.var_2279 = param8;
         this.var_2283 = param9;
         this.var_2281 = param10;
      }
      
      public function dispose() : void
      {
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get method_1() : String
      {
         return this.var_1730;
      }
      
      public function get price() : int
      {
         return this.var_1666;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2282;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2285;
      }
      
      public function get periods() : int
      {
         return this.var_2284;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2280;
      }
      
      public function get year() : int
      {
         return this.var_2279;
      }
      
      public function get month() : int
      {
         return this.var_2283;
      }
      
      public function get day() : int
      {
         return this.var_2281;
      }
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return Purse.const_196;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1666;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_435;
      }
      
      public function get priceType() : String
      {
         return Offer.const_762;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1730;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_435 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2373;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2373 = param1;
      }
   }
}
