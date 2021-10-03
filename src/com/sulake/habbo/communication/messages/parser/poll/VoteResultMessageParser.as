package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1153:String;
      
      private var var_1368:Array;
      
      private var var_1244:Array;
      
      private var var_1687:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1153;
      }
      
      public function get choices() : Array
      {
         return this.var_1368.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1244.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1687;
      }
      
      public function flush() : Boolean
      {
         this.var_1153 = "";
         this.var_1368 = [];
         this.var_1244 = [];
         this.var_1687 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1153 = param1.readString();
         this.var_1368 = [];
         this.var_1244 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1368.push(param1.readString());
            this.var_1244.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1687 = param1.readInteger();
         return true;
      }
   }
}
