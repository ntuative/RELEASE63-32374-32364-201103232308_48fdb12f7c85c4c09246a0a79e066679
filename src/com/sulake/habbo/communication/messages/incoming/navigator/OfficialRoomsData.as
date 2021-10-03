package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomsData implements IDisposable, MsgWithRequestId
   {
       
      
      private var var_96:Array;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomsData(param1:IMessageDataWrapper)
      {
         this.var_96 = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_96.push(new OfficialRoomEntryData(param1));
            _loc3_++;
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_96 != null)
         {
            for each(_loc1_ in this.var_96)
            {
               _loc1_.dispose();
            }
         }
         this.var_96 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get entries() : Array
      {
         return this.var_96;
      }
   }
}
