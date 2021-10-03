package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1412:Boolean = false;
      
      private var var_1666:int;
      
      private var var_1690:Array;
      
      private var var_715:Array;
      
      private var var_714:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1412 = _loc2_.isWrappingEnabled;
         this.var_1666 = _loc2_.wrappingPrice;
         this.var_1690 = _loc2_.stuffTypes;
         this.var_715 = _loc2_.boxTypes;
         this.var_714 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1412;
      }
      
      public function get price() : int
      {
         return this.var_1666;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1690;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_715;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_714;
      }
   }
}
