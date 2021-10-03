package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerPreviewMessage extends RoomWidgetMessage
   {
      
      public static const const_192:String = "RWDPM_PREVIEW_DIMMER_PRESET";
       
      
      private var _color:uint;
      
      private var var_1148:int;
      
      private var var_2193:Boolean;
      
      public function RoomWidgetDimmerPreviewMessage(param1:uint, param2:int, param3:Boolean)
      {
         super(const_192);
         this._color = param1;
         this.var_1148 = param2;
         this.var_2193 = param3;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1148;
      }
      
      public function get bgOnly() : Boolean
      {
         return this.var_2193;
      }
   }
}
