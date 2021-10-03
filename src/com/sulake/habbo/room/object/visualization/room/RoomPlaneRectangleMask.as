package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2147:Number = 0.0;
      
      private var var_2148:Number = 0.0;
      
      private var var_2237:Number = 0.0;
      
      private var var_2236:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2147 = param1;
         this.var_2148 = param2;
         this.var_2237 = param3;
         this.var_2236 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2147;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2148;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2237;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2236;
      }
   }
}
