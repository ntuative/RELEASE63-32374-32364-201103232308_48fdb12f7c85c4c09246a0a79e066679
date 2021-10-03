package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_381:int;
      
      private var var_2152:int;
      
      private var var_2733:Boolean;
      
      private var var_2242:int;
      
      private var _ownerName:String;
      
      private var var_115:RoomData;
      
      private var var_804:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_381 = param1.readInteger();
         this.var_2152 = param1.readInteger();
         this.var_2733 = param1.readBoolean();
         this.var_2242 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_115 = new RoomData(param1);
         this.var_804 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_115 != null)
         {
            this.var_115.dispose();
            this.var_115 = null;
         }
         if(this.var_804 != null)
         {
            this.var_804.dispose();
            this.var_804 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_381;
      }
      
      public function get userCount() : int
      {
         return this.var_2152;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2733;
      }
      
      public function get ownerId() : int
      {
         return this.var_2242;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_115;
      }
      
      public function get event() : RoomData
      {
         return this.var_804;
      }
   }
}
