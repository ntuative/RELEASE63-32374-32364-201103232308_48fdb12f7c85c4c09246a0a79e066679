package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1845:int = 1;
      
      public static const const_1971:int = 2;
      
      public static const const_1808:int = 3;
      
      public static const const_1995:int = 4;
      
      public static const const_1570:int = 5;
      
      public static const const_1920:int = 6;
      
      public static const const_1565:int = 7;
      
      public static const const_1561:int = 8;
      
      public static const const_1941:int = 9;
      
      public static const const_1690:int = 10;
      
      public static const const_1656:int = 11;
      
      public static const const_1608:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1645:int;
      
      private var var_1450:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1645 = param1.readInteger();
         this.var_1450 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1645;
      }
      
      public function get info() : String
      {
         return this.var_1450;
      }
   }
}
