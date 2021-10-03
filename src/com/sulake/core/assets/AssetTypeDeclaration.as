package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2572:String;
      
      private var var_2571:Class;
      
      private var var_2573:Class;
      
      private var var_1839:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2572 = param1;
         this.var_2571 = param2;
         this.var_2573 = param3;
         if(rest == null)
         {
            this.var_1839 = new Array();
         }
         else
         {
            this.var_1839 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2572;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2571;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2573;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1839;
      }
   }
}
