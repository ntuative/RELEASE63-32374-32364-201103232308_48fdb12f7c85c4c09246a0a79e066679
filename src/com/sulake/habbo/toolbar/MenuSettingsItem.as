package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_2312:String;
      
      private var var_2509:Array;
      
      private var var_2507:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         this.var_2312 = param1;
         this.var_2509 = param2;
         this.var_2507 = param3;
      }
      
      public function get menuId() : String
      {
         return this.var_2312;
      }
      
      public function get yieldList() : Array
      {
         return this.var_2509;
      }
      
      public function get lockToIcon() : Boolean
      {
         return this.var_2507;
      }
   }
}
