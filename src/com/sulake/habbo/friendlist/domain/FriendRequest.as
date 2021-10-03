package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class FriendRequest implements IDisposable
   {
      
      public static const const_172:int = 1;
      
      public static const const_361:int = 2;
      
      public static const const_384:int = 3;
      
      public static const const_1055:int = 4;
       
      
      private var var_1103:int;
      
      private var var_2517:String;
      
      private var var_2516:int;
      
      private var _state:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_16:IWindowContainer;
      
      public function FriendRequest(param1:FriendRequestData)
      {
         super();
         this.var_1103 = param1.requestId;
         this.var_2517 = param1.requesterName;
         this.var_2516 = param1.requesterUserId;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.view != null)
         {
            this.view.destroy();
            this.view = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get requestId() : int
      {
         return this.var_1103;
      }
      
      public function get requesterName() : String
      {
         return this.var_2517;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2516;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_16;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this.var_16 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
   }
}
