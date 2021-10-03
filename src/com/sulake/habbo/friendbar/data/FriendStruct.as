package com.sulake.habbo.friendbar.data
{
   public class FriendStruct
   {
       
      
      private var _userName:String;
      
      private var var_1676:String;
      
      public function FriendStruct(param1:String, param2:String)
      {
         super();
         this._userName = param1;
         this.var_1676 = param2;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get realName() : String
      {
         return this.var_1676;
      }
   }
}
