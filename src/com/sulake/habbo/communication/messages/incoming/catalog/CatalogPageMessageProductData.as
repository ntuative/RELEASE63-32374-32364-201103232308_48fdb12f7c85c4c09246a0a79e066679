package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_76:String = "i";
      
      public static const const_86:String = "s";
      
      public static const const_181:String = "e";
       
      
      private var var_1922:String;
      
      private var var_2297:int;
      
      private var var_1497:String;
      
      private var var_1498:int;
      
      private var var_1920:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1922 = param1.readString();
         this.var_2297 = param1.readInteger();
         this.var_1497 = param1.readString();
         this.var_1498 = param1.readInteger();
         this.var_1920 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1922;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2297;
      }
      
      public function get extraParam() : String
      {
         return this.var_1497;
      }
      
      public function get productCount() : int
      {
         return this.var_1498;
      }
      
      public function get expiration() : int
      {
         return this.var_1920;
      }
   }
}
