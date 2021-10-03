package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementNotificationMessageParser implements IMessageParser
   {
       
      
      private var _type:int;
      
      private var var_1366:int;
      
      private var var_2002:int;
      
      private var var_2162:int;
      
      private var var_1685:int;
      
      private var var_1367:int;
      
      private var var_2163:String = "";
      
      private var var_2165:String = "";
      
      private var var_2164:int;
      
      public function HabboAchievementNotificationMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._type = param1.readInteger();
         this.var_1366 = param1.readInteger();
         this.var_2163 = param1.readString();
         this.var_2002 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1685 = param1.readInteger();
         this.var_1367 = param1.readInteger();
         this.var_2164 = param1.readInteger();
         this.var_2165 = param1.readString();
         return true;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1366;
      }
      
      public function get points() : int
      {
         return this.var_2002;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1685;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1367;
      }
      
      public function get badgeID() : String
      {
         return this.var_2163;
      }
      
      public function get achievementID() : int
      {
         return this.var_2164;
      }
      
      public function get removedBadgeID() : String
      {
         return this.var_2165;
      }
   }
}
