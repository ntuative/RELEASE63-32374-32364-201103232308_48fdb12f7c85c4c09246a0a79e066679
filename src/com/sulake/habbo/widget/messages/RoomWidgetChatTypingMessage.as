package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_776:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_653:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_776);
         this.var_653 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_653;
      }
   }
}
