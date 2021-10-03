package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1366:int;
      
      private var var_301:String;
      
      private var var_2569:int;
      
      private var var_2162:int;
      
      private var var_1685:int;
      
      private var var_2570:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1366 = param1.readInteger();
         this.var_301 = param1.readString();
         this.var_2569 = param1.readInteger();
         this.var_2162 = param1.readInteger();
         this.var_1685 = param1.readInteger();
         this.var_2570 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_301;
      }
      
      public function get level() : int
      {
         return this.var_1366;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_2569;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2162;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1685;
      }
      
      public function get currentPoints() : int
      {
         return this.var_2570;
      }
   }
}
