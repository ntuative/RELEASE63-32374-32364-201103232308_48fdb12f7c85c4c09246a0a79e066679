package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestAcceptedMessageParser implements IMessageParser
   {
       
      
      private var var_1700:String;
      
      private var var_1105:QuestMessageData;
      
      public function QuestAcceptedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1700 = "";
         if(this.var_1105)
         {
            this.var_1105.dispose();
         }
         this.var_1105 = null;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1700 = param1.readString();
         this.var_1105 = new QuestMessageData(param1);
         return true;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1700;
      }
      
      public function get questData() : QuestMessageData
      {
         return this.var_1105;
      }
   }
}
