package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1678:int;
      
      private var var_2178:String;
      
      private var var_1366:int;
      
      private var var_1084:int;
      
      private var var_1638:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1678 = param1.readInteger();
         this.var_2178 = param1.readString();
         this.var_1366 = param1.readInteger();
         this.var_1084 = param1.readInteger();
         this.var_1638 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1678;
      }
      
      public function get petName() : String
      {
         return this.var_2178;
      }
      
      public function get level() : int
      {
         return this.var_1366;
      }
      
      public function get petType() : int
      {
         return this.var_1084;
      }
      
      public function get breed() : int
      {
         return this.var_1638;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
