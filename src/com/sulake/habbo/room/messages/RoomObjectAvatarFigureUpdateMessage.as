package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_621:String;
      
      private var var_2537:String;
      
      private var var_933:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_621 = param1;
         this.var_933 = param2;
         this.var_2537 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_621;
      }
      
      public function get race() : String
      {
         return this.var_2537;
      }
      
      public function get gender() : String
      {
         return this.var_933;
      }
   }
}
