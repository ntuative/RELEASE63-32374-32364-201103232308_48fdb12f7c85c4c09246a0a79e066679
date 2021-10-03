package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_375:String = "RWGOI_MESSAGE_OPEN_CATALOG";
      
      public static const const_1198:String = "RWOCM_CLUB_MAIN";
      
      public static const const_1169:String = "RWOCM_PIXELS";
      
      public static const const_1069:String = "RWOCM_CREDITS";
       
      
      private var var_2137:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_375);
         this.var_2137 = param1;
      }
      
      public function get pageKey() : String
      {
         return this.var_2137;
      }
   }
}
