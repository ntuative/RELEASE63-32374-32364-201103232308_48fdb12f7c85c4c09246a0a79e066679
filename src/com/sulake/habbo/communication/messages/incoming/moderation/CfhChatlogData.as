package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1623:int;
      
      private var var_2222:int;
      
      private var var_1376:int;
      
      private var var_2223:int;
      
      private var var_115:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1623 = param1.readInteger();
         this.var_2222 = param1.readInteger();
         this.var_1376 = param1.readInteger();
         this.var_2223 = param1.readInteger();
         this.var_115 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1623);
      }
      
      public function get callId() : int
      {
         return this.var_1623;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2222;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1376;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2223;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_115;
      }
   }
}
