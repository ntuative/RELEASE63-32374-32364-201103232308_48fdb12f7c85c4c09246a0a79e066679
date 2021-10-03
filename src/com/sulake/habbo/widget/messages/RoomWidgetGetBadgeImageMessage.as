package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_811:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_301:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_811);
         this.var_301 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_301;
      }
   }
}
