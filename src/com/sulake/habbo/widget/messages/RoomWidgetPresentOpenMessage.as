package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_171:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_391:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_391 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_391;
      }
   }
}
