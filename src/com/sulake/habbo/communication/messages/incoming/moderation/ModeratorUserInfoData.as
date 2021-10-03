package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var _userId:int;
      
      private var _userName:String;
      
      private var var_2746:int;
      
      private var var_2751:int;
      
      private var var_743:Boolean;
      
      private var var_2748:int;
      
      private var var_2747:int;
      
      private var var_2749:int;
      
      private var var_2750:int;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
         this.var_2746 = param1.readInteger();
         this.var_2751 = param1.readInteger();
         this.var_743 = param1.readBoolean();
         this.var_2748 = param1.readInteger();
         this.var_2747 = param1.readInteger();
         this.var_2749 = param1.readInteger();
         this.var_2750 = param1.readInteger();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return this.var_2746;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return this.var_2751;
      }
      
      public function get online() : Boolean
      {
         return this.var_743;
      }
      
      public function get cfhCount() : int
      {
         return this.var_2748;
      }
      
      public function get abusiveCfhCount() : int
      {
         return this.var_2747;
      }
      
      public function get cautionCount() : int
      {
         return this.var_2749;
      }
      
      public function get banCount() : int
      {
         return this.var_2750;
      }
   }
}
