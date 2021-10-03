package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPlayerValueUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_190:int;
      
      public function RoomObjectAvatarPlayerValueUpdateMessage(param1:int)
      {
         super();
         this.var_190 = param1;
      }
      
      public function get value() : int
      {
         return this.var_190;
      }
   }
}
