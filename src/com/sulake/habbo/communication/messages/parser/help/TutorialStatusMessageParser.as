package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1176:Boolean;
      
      private var var_1177:Boolean;
      
      private var var_1451:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return this.var_1176;
      }
      
      public function get hasChangedName() : Boolean
      {
         return this.var_1177;
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return this.var_1451;
      }
      
      public function flush() : Boolean
      {
         this.var_1176 = false;
         this.var_1177 = false;
         this.var_1451 = false;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1176 = param1.readBoolean();
         this.var_1177 = param1.readBoolean();
         this.var_1451 = param1.readBoolean();
         return true;
      }
   }
}
