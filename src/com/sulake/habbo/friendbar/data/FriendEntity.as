package com.sulake.habbo.friendbar.data
{
   public class FriendEntity implements IFriendEntity
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_743:Boolean;
      
      private var var_1697:Boolean;
      
      private var var_621:String;
      
      private var var_1409:int;
      
      private var var_1674:String;
      
      private var var_1675:String;
      
      private var var_1676:String;
      
      public function FriendEntity(param1:int, param2:String, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:String, param9:int, param10:String)
      {
         super();
         this._id = param1;
         this._name = param2;
         this.var_1676 = param3;
         this.var_1674 = param4;
         this.var_933 = param5;
         this.var_743 = param6;
         this.var_1697 = param7;
         this.var_621 = param8;
         this.var_1409 = param9;
         this.var_1675 = param10;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_933;
      }
      
      public function get online() : Boolean
      {
         return this.var_743;
      }
      
      public function get allowFollow() : Boolean
      {
         return this.var_1697;
      }
      
      public function get figure() : String
      {
         return this.var_621;
      }
      
      public function get categoryId() : int
      {
         return this.var_1409;
      }
      
      public function get motto() : String
      {
         return this.var_1674;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1675;
      }
      
      public function get realName() : String
      {
         return this.var_1676;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_933 = param1;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_743 = param1;
      }
      
      public function set allowFollow(param1:Boolean) : void
      {
         this.var_1697 = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_621 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1409 = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1674 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1675 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1676 = param1;
      }
   }
}
