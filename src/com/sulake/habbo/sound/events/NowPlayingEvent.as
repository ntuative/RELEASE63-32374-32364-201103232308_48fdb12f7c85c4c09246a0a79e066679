package com.sulake.habbo.sound.events
{
   import flash.events.Event;
   
   public class NowPlayingEvent extends Event
   {
      
      public static const const_798:String = "NPE_SONG_CHANGED";
       
      
      private var _id:int;
      
      private var var_469:int;
      
      public function NowPlayingEvent(param1:String, param2:int, param3:int, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param4,param5);
         this._id = param2;
         this.var_469 = param3;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get position() : int
      {
         return this.var_469;
      }
   }
}
