package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_115:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1811:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_115);
         this.var_1811 = param1;
      }
      
      public function get vote() : int
      {
         return this.var_1811;
      }
   }
}
