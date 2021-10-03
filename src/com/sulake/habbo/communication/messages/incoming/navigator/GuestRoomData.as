package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_381:int;
      
      private var var_804:Boolean;
      
      private var var_950:String;
      
      private var _ownerName:String;
      
      private var var_2412:int;
      
      private var var_2152:int;
      
      private var var_2416:int;
      
      private var var_1797:String;
      
      private var var_2418:int;
      
      private var var_2414:Boolean;
      
      private var var_787:int;
      
      private var var_1409:int;
      
      private var var_2415:String;
      
      private var var_846:Array;
      
      private var var_2417:RoomThumbnailData;
      
      private var var_2413:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_846 = new Array();
         super();
         this.var_381 = param1.readInteger();
         this.var_804 = param1.readBoolean();
         this.var_950 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2412 = param1.readInteger();
         this.var_2152 = param1.readInteger();
         this.var_2416 = param1.readInteger();
         this.var_1797 = param1.readString();
         this.var_2418 = param1.readInteger();
         this.var_2414 = param1.readBoolean();
         this.var_787 = param1.readInteger();
         this.var_1409 = param1.readInteger();
         this.var_2415 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_846.push(_loc4_);
            _loc3_++;
         }
         this.var_2417 = new RoomThumbnailData(param1);
         this.var_2413 = param1.readBoolean();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_846 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get flatId() : int
      {
         return this.var_381;
      }
      
      public function get event() : Boolean
      {
         return this.var_804;
      }
      
      public function get roomName() : String
      {
         return this.var_950;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2412;
      }
      
      public function get userCount() : int
      {
         return this.var_2152;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2416;
      }
      
      public function get description() : String
      {
         return this.var_1797;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2418;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2414;
      }
      
      public function get score() : int
      {
         return this.var_787;
      }
      
      public function get categoryId() : int
      {
         return this.var_1409;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2415;
      }
      
      public function get tags() : Array
      {
         return this.var_846;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2417;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2413;
      }
   }
}
