package com.sulake.habbo.session
{
   public class GivableBadgeData
   {
       
      
      private var var_301:int;
      
      private var var_2431:String;
      
      public function GivableBadgeData(param1:int, param2:String)
      {
         super();
         this.var_301 = param1;
         this.var_2431 = param2;
      }
      
      public function get badgeId() : int
      {
         return this.var_301;
      }
      
      public function get achievementTypeName() : String
      {
         return this.var_2431;
      }
   }
}
