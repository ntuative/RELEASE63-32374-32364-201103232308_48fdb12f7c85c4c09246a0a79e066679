package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var _type:String = "";
      
      private var var_1768:String = "";
      
      private var var_1874:String = "";
      
      private var var_2275:String = "";
      
      private var var_2687:Number = 0;
      
      private var var_2686:Number = 0;
      
      private var var_2665:Number = 0;
      
      private var var_2663:Number = 0;
      
      private var var_2207:Boolean = false;
      
      private var var_2206:Boolean = false;
      
      private var var_2204:Boolean = false;
      
      private var var_2205:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1768 = param2;
         this.var_1874 = param3;
         this.var_2275 = param4;
         this.var_2687 = param5;
         this.var_2686 = param6;
         this.var_2665 = param7;
         this.var_2663 = param8;
         this.var_2207 = param9;
         this.var_2206 = param10;
         this.var_2204 = param11;
         this.var_2205 = param12;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get eventId() : String
      {
         return this.var_1768;
      }
      
      public function get canvasId() : String
      {
         return this.var_1874;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2275;
      }
      
      public function get screenX() : Number
      {
         return this.var_2687;
      }
      
      public function get screenY() : Number
      {
         return this.var_2686;
      }
      
      public function get localX() : Number
      {
         return this.var_2665;
      }
      
      public function get localY() : Number
      {
         return this.var_2663;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2207;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2206;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2204;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2205;
      }
   }
}
