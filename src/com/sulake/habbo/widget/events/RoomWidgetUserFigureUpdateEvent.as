package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserFigureUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_164:String = "RWUTUE_USER_FIGURE";
       
      
      private var _userId:int;
      
      private var var_46:BitmapData;
      
      private var var_2576:Boolean;
      
      private var var_1894:String = "";
      
      private var var_2185:int;
      
      public function RoomWidgetUserFigureUpdateEvent(param1:int, param2:BitmapData, param3:Boolean, param4:String, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_164,param6,param7);
         this._userId = param1;
         this.var_46 = param2;
         this.var_2576 = param3;
         this.var_1894 = param4;
         this.var_2185 = param5;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2576;
      }
      
      public function get customInfo() : String
      {
         return this.var_1894;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2185;
      }
   }
}
