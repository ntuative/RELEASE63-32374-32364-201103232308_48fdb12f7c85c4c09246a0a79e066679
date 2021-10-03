package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2119:int;
      
      private var var_1776:String;
      
      private var var_2120:String;
      
      private var var_2116:Boolean;
      
      private var var_2118:Boolean;
      
      private var var_2117:int;
      
      private var var_2114:String;
      
      private var var_2115:String;
      
      private var var_1676:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2119 = param1.readInteger();
         this.var_1776 = param1.readString();
         this.var_2120 = param1.readString();
         this.var_2116 = param1.readBoolean();
         this.var_2118 = param1.readBoolean();
         param1.readString();
         this.var_2117 = param1.readInteger();
         this.var_2114 = param1.readString();
         this.var_2115 = param1.readString();
         this.var_1676 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2119;
      }
      
      public function get avatarName() : String
      {
         return this.var_1776;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2120;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2116;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2118;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2117;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2114;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2115;
      }
      
      public function get realName() : String
      {
         return this.var_1676;
      }
   }
}
