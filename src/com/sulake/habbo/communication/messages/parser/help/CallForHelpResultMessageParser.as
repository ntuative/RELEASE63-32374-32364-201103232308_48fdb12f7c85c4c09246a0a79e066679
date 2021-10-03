package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpResultMessageParser implements IMessageParser
   {
       
      
      private var var_2011:int;
      
      public function CallForHelpResultMessageParser()
      {
         super();
      }
      
      public function get resultType() : int
      {
         return this.var_2011;
      }
      
      public function flush() : Boolean
      {
         this.var_2011 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2011 = param1.readInteger();
         return true;
      }
   }
}
