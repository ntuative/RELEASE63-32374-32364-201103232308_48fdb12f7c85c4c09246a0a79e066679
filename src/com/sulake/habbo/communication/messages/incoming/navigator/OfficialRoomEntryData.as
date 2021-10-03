package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1219:int = 1;
      
      public static const const_720:int = 2;
      
      public static const const_806:int = 3;
      
      public static const const_1685:int = 4;
       
      
      private var _index:int;
      
      private var var_2154:String;
      
      private var var_2151:String;
      
      private var var_2149:Boolean;
      
      private var var_2150:String;
      
      private var var_871:String;
      
      private var var_2153:int;
      
      private var var_2152:int;
      
      private var _type:int;
      
      private var var_2155:String;
      
      private var var_865:GuestRoomData;
      
      private var var_866:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2154 = param1.readString();
         this.var_2151 = param1.readString();
         this.var_2149 = param1.readInteger() == 1;
         this.var_2150 = param1.readString();
         this.var_871 = param1.readString();
         this.var_2153 = param1.readInteger();
         this.var_2152 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1219)
         {
            this.var_2155 = param1.readString();
         }
         else if(this._type == const_806)
         {
            this.var_866 = new PublicRoomData(param1);
         }
         else if(this._type == const_720)
         {
            this.var_865 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_865 != null)
         {
            this.var_865.dispose();
            this.var_865 = null;
         }
         if(this.var_866 != null)
         {
            this.var_866.dispose();
            this.var_866 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2154;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2151;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2149;
      }
      
      public function get picText() : String
      {
         return this.var_2150;
      }
      
      public function get picRef() : String
      {
         return this.var_871;
      }
      
      public function get folderId() : int
      {
         return this.var_2153;
      }
      
      public function get tag() : String
      {
         return this.var_2155;
      }
      
      public function get userCount() : int
      {
         return this.var_2152;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_865;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_866;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1219)
         {
            return 0;
         }
         if(this.type == const_720)
         {
            return this.var_865.maxUserCount;
         }
         if(this.type == const_806)
         {
            return this.var_866.maxUsers;
         }
         return 0;
      }
   }
}
