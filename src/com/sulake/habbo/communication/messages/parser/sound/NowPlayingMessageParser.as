package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1889:int;
      
      private var _currentPosition:int;
      
      private var var_1888:int;
      
      private var var_1890:int;
      
      private var var_1887:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1889;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1888;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1890;
      }
      
      public function get syncCount() : int
      {
         return this.var_1887;
      }
      
      public function flush() : Boolean
      {
         this.var_1889 = -1;
         this._currentPosition = -1;
         this.var_1888 = -1;
         this.var_1890 = -1;
         this.var_1887 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1889 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1888 = param1.readInteger();
         this.var_1890 = param1.readInteger();
         this.var_1887 = param1.readInteger();
         return true;
      }
   }
}
