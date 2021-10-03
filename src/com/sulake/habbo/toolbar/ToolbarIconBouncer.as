package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2533:Number;
      
      private var var_2010:Number;
      
      private var var_955:Number;
      
      private var var_533:Number = 0;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         this.var_2533 = param1;
         this.var_2010 = param2;
      }
      
      public function reset(param1:int) : void
      {
         this.var_955 = param1;
         this.var_533 = 0;
      }
      
      public function update() : void
      {
         this.var_955 += this.var_2010;
         this.var_533 += this.var_955;
         if(this.var_533 > 0)
         {
            this.var_533 = 0;
            this.var_955 = this.var_2533 * -1 * this.var_955;
         }
      }
      
      public function get location() : Number
      {
         return this.var_533;
      }
   }
}
