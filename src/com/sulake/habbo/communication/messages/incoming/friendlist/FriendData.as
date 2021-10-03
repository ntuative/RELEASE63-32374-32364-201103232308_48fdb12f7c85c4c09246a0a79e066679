package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_933:int;
      
      private var var_743:Boolean;
      
      private var var_1677:Boolean;
      
      private var var_621:String;
      
      private var var_1409:int;
      
      private var var_1674:String;
      
      private var var_1675:String;
      
      private var var_1676:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_933 = param1.readInteger();
         this.var_743 = param1.readBoolean();
         this.var_1677 = param1.readBoolean();
         this.var_621 = param1.readString();
         this.var_1409 = param1.readInteger();
         this.var_1674 = param1.readString();
         this.var_1675 = param1.readString();
         this.var_1676 = param1.readString();
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
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1677;
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
   }
}
