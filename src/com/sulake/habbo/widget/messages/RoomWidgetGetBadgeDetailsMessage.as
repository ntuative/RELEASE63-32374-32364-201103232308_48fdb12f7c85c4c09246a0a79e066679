package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_882:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_1526:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_882);
         this.var_1526 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1526;
      }
   }
}
