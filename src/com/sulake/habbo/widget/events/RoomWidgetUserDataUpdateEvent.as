package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_114:String = "rwudue_user_data_updated";
       
      
      public function RoomWidgetUserDataUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super(const_114,param1,param2);
      }
   }
}
