package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniGiftReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_2263:String;
      
      private var var_2265:Boolean;
      
      public function ViralFurniGiftReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2263 = param1.readString();
         this.var_2265 = param1.readBoolean();
         return true;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2263;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2265;
      }
   }
}
