package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2719:int;
      
      private var var_2722:int;
      
      private var var_2721:int;
      
      private var var_2720:String;
      
      private var var_1717:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2719 = param1.readInteger();
         this.var_2722 = param1.readInteger();
         this.var_2721 = param1.readInteger();
         this.var_2720 = param1.readString();
         this.var_1717 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2719;
      }
      
      public function get minute() : int
      {
         return this.var_2722;
      }
      
      public function get chatterId() : int
      {
         return this.var_2721;
      }
      
      public function get chatterName() : String
      {
         return this.var_2720;
      }
      
      public function get msg() : String
      {
         return this.var_1717;
      }
   }
}
