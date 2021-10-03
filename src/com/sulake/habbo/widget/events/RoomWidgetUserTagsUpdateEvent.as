package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_160:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_846:Array;
      
      private var var_2576:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_160,param4,param5);
         this._userId = param1;
         this.var_846 = param2;
         this.var_2576 = param3;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get tags() : Array
      {
         return this.var_846;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2576;
      }
   }
}
