package com.sulake.habbo.sound.music
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SoundCompleteEvent;
   import flash.events.IEventDispatcher;
   
   public class GenericPlaylist implements IPlayListController, IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_96:Array;
      
      protected var var_198:IHabboMusicController;
      
      protected var _events:IEventDispatcher;
      
      protected var _priority:int = 1;
      
      protected var var_469:int = 0;
      
      protected var var_584:Boolean = false;
      
      public function GenericPlaylist(param1:IHabboMusicController, param2:IEventDispatcher)
      {
         this.var_96 = new Array();
         super();
         this.var_198 = param1;
         this._events = param2;
         this._events.addEventListener(SoundCompleteEvent.const_391,this.onSongFinishedPlayingEvent);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function get length() : int
      {
         return this.var_96.length;
      }
      
      public function get playPosition() : int
      {
         return this.var_469;
      }
      
      public function get isPlaying() : Boolean
      {
         return this.var_584;
      }
      
      public function get nowPlayingSongId() : int
      {
         var _loc1_:SongDataEntry = this.var_96[this.var_469];
         return _loc1_.id;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      public function set playPosition(param1:int) : void
      {
         this.var_469 = param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.stopPlaying();
            this.var_96 = null;
            this.var_198 = null;
            if(this._events)
            {
               this._events.removeEventListener(SoundCompleteEvent.const_391,this.onSongFinishedPlayingEvent);
               this._events = null;
            }
            this._disposed = true;
         }
      }
      
      public function addItem(param1:ISongInfo, param2:int = -1) : int
      {
         var _loc3_:SongDataEntry = param1 as SongDataEntry;
         if(_loc3_ == null)
         {
            Logger.log("WARNING could not convert added playlist item to SongDataEntry");
            return -1;
         }
         if(param2 == -1)
         {
            return this.var_96.push(_loc3_) - 1;
         }
         this.var_96.splice(param2,0,_loc3_);
         return param2;
      }
      
      public function getEntry(param1:int) : ISongInfo
      {
         if(param1 < 0 || param1 >= this.var_96.length)
         {
            return null;
         }
         return this.var_96[param1];
      }
      
      public function moveItem(param1:int, param2:int) : void
      {
         if(param1 < 0 || param1 >= this.var_96.length)
         {
            return;
         }
         if(param2 < 0 || param2 >= this.var_96.length)
         {
            return;
         }
         var _loc3_:Array = this.var_96.splice(param1,1);
         this.var_96.splice(param2,0,_loc3_[0]);
      }
      
      public function removeItem(param1:int) : void
      {
         if(param1 < 0 || param1 >= this.var_96.length)
         {
            return;
         }
         this.var_96.splice(param1,1);
      }
      
      public function startPlaying() : void
      {
         this.var_198.stop(this._priority);
         var _loc1_:SongDataEntry = this.getEntry(this.var_469) as SongDataEntry;
         this.var_198.playSong(_loc1_.id,this._priority);
         this.var_584 = true;
      }
      
      public function stopPlaying() : void
      {
         var _loc1_:SongDataEntry = this.getEntry(this.var_469) as SongDataEntry;
         this.var_198.stopSong(_loc1_.id);
         this.var_584 = false;
      }
      
      public function requestPlayList() : void
      {
         Logger.log("WARNING: Unimplemented method \'requestPlayList\' of GenericPlayList base class called!");
      }
      
      public function copyRoomItemPlaylist(param1:SoundMachinePlayListController) : void
      {
      }
      
      protected function onSongFinishedPlayingEvent(param1:SoundCompleteEvent) : void
      {
         var _loc2_:SongDataEntry = this.getEntry(this.var_469) as SongDataEntry;
         if(param1.id == _loc2_.id)
         {
            this.playNextItem();
         }
      }
      
      protected function playNextItem() : void
      {
         var _loc1_:SongDataEntry = this.getEntry(this.var_469) as SongDataEntry;
         this.var_198.stopSong(_loc1_.id);
         var _loc2_:SongDataEntry = this.getEntry(this.getNextIndex()) as SongDataEntry;
         this.var_198.playSong(_loc2_.id,this._priority);
         this.var_469 = this.getNextIndex();
      }
      
      protected function getNextIndex() : int
      {
         return this.var_469 + 1 >= this.var_96.length ? 0 : int(this.var_469 + 1);
      }
   }
}
