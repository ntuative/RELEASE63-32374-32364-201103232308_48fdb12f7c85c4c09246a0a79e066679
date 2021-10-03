package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1879:Boolean;
      
      private var var_2630:int;
      
      private var var_453:Boolean;
      
      private var var_1200:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function get guestRoom() : Boolean
      {
         return this.var_1879;
      }
      
      public function get guestRoomId() : int
      {
         return this.var_2630;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return this.var_1200;
      }
      
      public function get owner() : Boolean
      {
         return this.var_453;
      }
      
      public function flush() : Boolean
      {
         if(this.var_1200 != null)
         {
            this.var_1200.dispose();
            this.var_1200 = null;
         }
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1879 = param1.readBoolean();
         if(this.var_1879)
         {
            this.var_2630 = param1.readInteger();
            this.var_453 = param1.readBoolean();
         }
         else
         {
            this.var_1200 = new PublicRoomShortData(param1);
         }
         return true;
      }
   }
}
