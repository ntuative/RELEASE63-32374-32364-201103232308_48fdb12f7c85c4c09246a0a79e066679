package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_2125:int;
      
      private var var_2123:int;
      
      private var var_2124:int;
      
      private var _dayOffsets:Array;
      
      private var var_1615:Array;
      
      private var var_1614:Array;
      
      private var var_2127:int;
      
      private var var_2126:int;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2125;
      }
      
      public function get offerCount() : int
      {
         return this.var_2123;
      }
      
      public function get historyLength() : int
      {
         return this.var_2124;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1615;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1614;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2127;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2126;
      }
      
      public function set averagePrice(param1:int) : void
      {
         this.var_2125 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_2123 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         this.var_2124 = param1;
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         this._dayOffsets = param1.slice();
      }
      
      public function set averagePrices(param1:Array) : void
      {
         this.var_1615 = param1.slice();
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         this.var_1614 = param1.slice();
      }
      
      public function set furniTypeId(param1:int) : void
      {
         this.var_2127 = param1;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         this.var_2126 = param1;
      }
   }
}
