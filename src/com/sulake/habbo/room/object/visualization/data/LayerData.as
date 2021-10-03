package com.sulake.habbo.room.object.visualization.data
{
   public class LayerData
   {
      
      public static const const_631:String = "";
      
      public static const const_400:int = 0;
      
      public static const const_508:int = 255;
      
      public static const const_916:Boolean = false;
      
      public static const const_566:int = 0;
      
      public static const const_565:int = 0;
      
      public static const const_399:int = 0;
      
      public static const const_1018:int = 1;
      
      public static const const_1210:int = 2;
      
      public static const INK_DARKEN:int = 3;
       
      
      private var var_2155:String = "";
      
      private var var_1967:int = 0;
      
      private var var_2359:int = 255;
      
      private var var_2407:Boolean = false;
      
      private var var_2404:int = 0;
      
      private var var_2406:int = 0;
      
      private var var_2405:Number = 0;
      
      public function LayerData()
      {
         super();
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2155 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2155;
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1967 = param1;
      }
      
      public function get ink() : int
      {
         return this.var_1967;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2359 = param1;
      }
      
      public function get alpha() : int
      {
         return this.var_2359;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2407 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2407;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2404 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2404;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2406 = param1;
      }
      
      public function get yOffset() : int
      {
         return this.var_2406;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2405 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2405;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
   }
}
