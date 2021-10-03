package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1503:int = 1;
      
      public static const const_1942:int = 2;
      
      public static const const_1606:int = 3;
      
      public static const const_1717:int = 4;
       
      
      private var var_1449:int = 0;
      
      private var var_1448:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1449 = 0;
         this.var_1448 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1449 = param1.readInteger();
         if(this.var_1449 == 3)
         {
            this.var_1448 = param1.readString();
         }
         else
         {
            this.var_1448 = "";
         }
         return true;
      }
      
      public function get reason() : int
      {
         return this.var_1449;
      }
      
      public function get parameter() : String
      {
         return this.var_1448;
      }
   }
}
