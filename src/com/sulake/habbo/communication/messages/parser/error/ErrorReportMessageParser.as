package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1645:int;
      
      private var var_1643:int;
      
      private var var_1644:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1643 = param1.readInteger();
         this.var_1645 = param1.readInteger();
         this.var_1644 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1645 = 0;
         this.var_1643 = 0;
         this.var_1644 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1645;
      }
      
      public function get messageId() : int
      {
         return this.var_1643;
      }
      
      public function get timestamp() : String
      {
         return this.var_1644;
      }
   }
}
