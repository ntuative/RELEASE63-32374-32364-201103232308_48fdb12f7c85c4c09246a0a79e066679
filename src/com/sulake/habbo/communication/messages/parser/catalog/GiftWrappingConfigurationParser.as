package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2713:Boolean;
      
      private var var_2714:int;
      
      private var var_1690:Array;
      
      private var var_715:Array;
      
      private var var_714:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2713;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2714;
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1690 = [];
         this.var_715 = [];
         this.var_714 = [];
         this.var_2713 = param1.readBoolean();
         this.var_2714 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1690.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_715.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_714.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
