package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_621:String;
      
      private var var_993:String;
      
      private var var_2446:String;
      
      private var var_1676:String;
      
      private var var_2448:int;
      
      private var var_2444:String;
      
      private var var_2447:int;
      
      private var var_2445:int;
      
      private var var_2449:int;
      
      private var _respectLeft:int;
      
      private var var_712:int;
      
      private var var_2256:int;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_621 = param1.readString();
         this.var_993 = param1.readString();
         this.var_2446 = param1.readString();
         this.var_1676 = param1.readString();
         this.var_2448 = param1.readInteger();
         this.var_2444 = param1.readString();
         this.var_2447 = param1.readInteger();
         this.var_2445 = param1.readInteger();
         this.var_2449 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_712 = param1.readInteger();
         this.var_2256 = param1.readInteger();
         return true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get figure() : String
      {
         return this.var_621;
      }
      
      public function get sex() : String
      {
         return this.var_993;
      }
      
      public function get customData() : String
      {
         return this.var_2446;
      }
      
      public function get realName() : String
      {
         return this.var_1676;
      }
      
      public function get tickets() : int
      {
         return this.var_2448;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2444;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2447;
      }
      
      public function get directMail() : int
      {
         return this.var_2445;
      }
      
      public function get respectTotal() : int
      {
         return this.var_2449;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_712;
      }
      
      public function get identityId() : int
      {
         return this.var_2256;
      }
   }
}
