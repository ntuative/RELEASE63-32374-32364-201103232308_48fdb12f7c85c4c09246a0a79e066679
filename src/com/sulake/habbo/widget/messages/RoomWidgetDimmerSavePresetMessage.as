package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_835:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2272:int;
      
      private var var_2269:int;
      
      private var _color:uint;
      
      private var var_1148:int;
      
      private var var_2347:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_835);
         this.var_2272 = param1;
         this.var_2269 = param2;
         this._color = param3;
         this.var_1148 = param4;
         this.var_2347 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2272;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2269;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1148;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2347;
      }
   }
}
