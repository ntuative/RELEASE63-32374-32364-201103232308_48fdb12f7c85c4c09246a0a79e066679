package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1412:Boolean;
      
      private var var_2389:int;
      
      private var var_1747:int;
      
      private var var_1746:int;
      
      private var var_2394:int;
      
      private var var_2390:int;
      
      private var var_2393:int;
      
      private var var_2395:int;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1412;
      }
      
      public function get commission() : int
      {
         return this.var_2389;
      }
      
      public function get tokenBatchPrice() : int
      {
         return this.var_1747;
      }
      
      public function get tokenBatchSize() : int
      {
         return this.var_1746;
      }
      
      public function get offerMinPrice() : int
      {
         return this.var_2390;
      }
      
      public function get offerMaxPrice() : int
      {
         return this.var_2394;
      }
      
      public function get expirationHours() : int
      {
         return this.var_2393;
      }
      
      public function get averagePricePeriod() : int
      {
         return this.var_2395;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1412 = param1.readBoolean();
         this.var_2389 = param1.readInteger();
         this.var_1747 = param1.readInteger();
         this.var_1746 = param1.readInteger();
         this.var_2390 = param1.readInteger();
         this.var_2394 = param1.readInteger();
         this.var_2393 = param1.readInteger();
         this.var_2395 = param1.readInteger();
         return true;
      }
   }
}
