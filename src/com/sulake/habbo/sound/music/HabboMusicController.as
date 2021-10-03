package com.sulake.habbo.sound.music
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.incoming.sound.SongInfoEntry;
   import com.sulake.habbo.communication.messages.incoming.sound.TraxSongInfoMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.UserSongDisksInventoryMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSongInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetUserSongDisksMessageComposer;
   import com.sulake.habbo.communication.messages.parser.sound.TraxSongInfoMessageParser;
   import com.sulake.habbo.communication.messages.parser.sound.UserSongDisksInventoryMessageParser;
   import com.sulake.habbo.room.events.RoomObjectSoundMachineStateUpdateEvent;
   import com.sulake.habbo.sound.HabboSoundManagerFlash10;
   import com.sulake.habbo.sound.IHabboMusicController;
   import com.sulake.habbo.sound.IHabboSound;
   import com.sulake.habbo.sound.IPlayListController;
   import com.sulake.habbo.sound.ISongInfo;
   import com.sulake.habbo.sound.events.SongDiskInventoryReceivedEvent;
   import com.sulake.habbo.sound.events.SongInfoReceivedEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboMusicController implements IHabboMusicController, IDisposable
   {
      
      public static const const_1542:int = -1;
       
      
      private var var_512:HabboSoundManagerFlash10;
      
      private var _connection:IConnection;
      
      private var _events:IEventDispatcher;
      
      private var var_83:IEventDispatcher;
      
      private var var_140:Map;
      
      private var var_323:Array;
      
      private var var_538:Array;
      
      private var var_999:Map;
      
      private var var_998:Map;
      
      private var var_450:IPlayListController = null;
      
      private var _disposed:Boolean = false;
      
      private var var_173:Map;
      
      private var var_1000:int = 0;
      
      private var var_1224:Timer;
      
      private var var_1673:Map = null;
      
      public function HabboMusicController(param1:HabboSoundManagerFlash10, param2:IEventDispatcher, param3:IEventDispatcher, param4:IConnection)
      {
         this.var_140 = new Map();
         this.var_323 = new Array();
         this.var_538 = new Array();
         this.var_999 = new Map();
         this.var_998 = new Map();
         this.var_173 = new Map();
         super();
         this.var_512 = param1;
         this._events = param2;
         this.var_83 = param3;
         this._connection = param4;
         this._connection.addMessageEvent(new TraxSongInfoMessageEvent(this.onSongInfoMessage));
         this._connection.addMessageEvent(new UserSongDisksInventoryMessageEvent(this.onSongDiskInventoryMessage));
         this.var_83.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_792,this.onJukeboxInit);
         this.var_83.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_717,this.onJukeboxDispose);
         this.var_83.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_832,this.onSoundMachineInit);
         this.var_83.addEventListener(RoomObjectSoundMachineStateUpdateEvent.const_661,this.onSoundMachineDispose);
         this.var_1224 = new Timer(1000);
         this.var_1224.start();
         this.var_1224.addEventListener(TimerEvent.TIMER,this.sendNextSongRequestMessage);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get events() : IEventDispatcher
      {
         return this._events;
      }
      
      public function dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!this._disposed)
         {
            this.var_512 = null;
            this._connection = null;
            this.var_323 = null;
            this.var_538 = null;
            if(this.var_450)
            {
               this.var_450.dispose();
               this.var_450 = null;
            }
            if(this.var_140)
            {
               _loc1_ = 0;
               while(_loc1_ < this.var_140.length)
               {
                  _loc2_ = this.var_140.getValues()[_loc1_] as SongDataEntry;
                  _loc3_ = _loc2_.soundObject as IHabboSound;
                  if(_loc3_ != null)
                  {
                     _loc3_.stop();
                  }
                  _loc2_.soundObject = null;
                  _loc1_++;
               }
               this.var_140.dispose();
               this.var_140 = null;
            }
            this.var_1224.stop();
            this.var_1224 = null;
            if(this.var_83)
            {
               this.var_83.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_792,this.onJukeboxInit);
               this.var_83.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_717,this.onJukeboxDispose);
               this.var_83.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_832,this.onSoundMachineInit);
               this.var_83.removeEventListener(RoomObjectSoundMachineStateUpdateEvent.const_661,this.onSoundMachineDispose);
            }
            this._disposed = true;
         }
      }
      
      public function getRoomItemPlaylist(param1:int = -1) : IPlayListController
      {
         return this.var_450;
      }
      
      public function playSong(param1:int, param2:int, param3:Number = 0) : Boolean
      {
         var _loc7_:int = 0;
         var _loc8_:* = null;
         if(this.var_173.getKeys().indexOf(param2) != -1)
         {
            this.var_173.add(param2,param1);
         }
         else
         {
            this.var_173[param2] = param1;
         }
         while(this.var_538.indexOf(param1) != -1)
         {
            this.var_538.splice(this.var_538.indexOf(param1),1);
         }
         var _loc4_:Date = new Date();
         var _loc5_:SongDataEntry = this.var_140.getValue(param1) as SongDataEntry;
         if(_loc5_ == null)
         {
            this.addSongInfoRequest(param1);
            this.var_999.add(param1,_loc4_.getTime());
            this.var_998.add(param1,param3);
            return false;
         }
         this.var_998[param1] = param3;
         if(_loc5_.soundObject == null)
         {
            this.var_999[param1] = _loc4_.getTime();
            this.var_998[param1] = param3;
            _loc5_.soundObject = this.var_512.loadTraxSong(_loc5_.id,_loc5_.songData);
            if(_loc5_.soundObject == null)
            {
               return false;
            }
         }
         var _loc6_:IHabboSound = _loc5_.soundObject;
         if(!_loc6_.ready)
         {
            return false;
         }
         if(param2 >= this.var_1000)
         {
            for each(_loc7_ in this.var_173.getValues())
            {
               if(_loc7_ != param1)
               {
                  _loc8_ = this.var_140.getValue(_loc7_) as SongDataEntry;
                  _loc8_.soundObject.stop();
               }
            }
            this.playSongObject(param1,param3);
            Logger.log("Started playing song: " + param1);
            this.var_1000 = param2;
         }
         else
         {
            Logger.log("Song play was rejected because of low priority: " + param1);
         }
         return true;
      }
      
      public function stopSong(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:SongDataEntry = this.var_140.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            _loc2_.soundObject.stop();
         }
         var _loc3_:int = this.var_173.getValues().indexOf(_loc2_);
         if(_loc3_ != -1)
         {
            _loc4_ = this.var_173.getKeys()[_loc3_];
            this.var_173.remove(_loc4_);
            this.var_1000 = this.getTopPriority();
         }
      }
      
      public function stop(param1:int = 10) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_173.length)
         {
            _loc3_ = this.var_173.getKeys()[_loc2_];
            if(_loc3_ <= param1)
            {
               _loc4_ = this.var_173.getValues()[_loc2_];
               _loc5_ = this.var_140.getValue(_loc4_) as SongDataEntry;
               if(_loc5_ != null)
               {
                  _loc6_ = _loc5_.soundObject;
                  if(_loc6_ != null)
                  {
                     _loc6_.stop();
                  }
               }
            }
            _loc2_++;
         }
      }
      
      public function previewSong(param1:int, param2:int) : void
      {
      }
      
      public function getSongObject(param1:int) : IHabboSound
      {
         var _loc2_:SongDataEntry = this.var_140.getValue(param1) as SongDataEntry;
         if(_loc2_ != null)
         {
            return _loc2_.soundObject;
         }
         return null;
      }
      
      public function updateVolume(param1:Number) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         for each(_loc2_ in this.var_173.getKeys())
         {
            _loc3_ = this.var_140.getValue(_loc2_) as SongDataEntry;
            if(_loc3_ != null)
            {
               _loc3_.soundObject.volume = param1;
            }
         }
      }
      
      public function onSongLoaded(param1:int) : void
      {
         this.var_1000 = this.getTopPriority();
         var _loc2_:int = this.var_173[this.var_1000];
         Logger.log("Song loaded : " + param1);
         if(param1 == _loc2_)
         {
            this.playSongObject(param1,this.var_998[param1]);
         }
      }
      
      public function addSongInfoRequest(param1:int) : void
      {
         this.var_323.push(param1);
      }
      
      public function requestSongInfoWithoutSamples(param1:int) : void
      {
         if(this.var_323.indexOf(param1) == -1)
         {
            this.var_323.push(param1);
            this.var_538.push(param1);
         }
      }
      
      public function getSongInfo(param1:int) : ISongInfo
      {
         if(this.var_140.getKeys().indexOf(param1) == -1)
         {
            this.requestSongInfoWithoutSamples(param1);
         }
         return this.var_140.getValue(param1);
      }
      
      public function requestUserSongDisks() : void
      {
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetUserSongDisksMessageComposer());
      }
      
      public function getSongDiskInventory() : Map
      {
         return this.var_1673;
      }
      
      public function getSongIdPlayingAtPriority(param1:int) : int
      {
         if(this.var_173.getKeys().indexOf(param1) == -1)
         {
            return -1;
         }
         return this.var_173[param1];
      }
      
      private function sendNextSongRequestMessage(param1:TimerEvent) : void
      {
         if(this.var_323.length < 1)
         {
            return;
         }
         if(this._connection == null)
         {
            return;
         }
         this._connection.send(new GetSongInfoMessageComposer(this.var_323));
         Logger.log("Requested song info\'s : " + this.var_323);
         this.var_323 = new Array();
      }
      
      private function onSongInfoMessage(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = false;
         var _loc8_:* = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc2_:TraxSongInfoMessageEvent = param1 as TraxSongInfoMessageEvent;
         var _loc3_:TraxSongInfoMessageParser = _loc2_.getParser() as TraxSongInfoMessageParser;
         var _loc4_:Array = _loc3_.songs;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_];
            _loc7_ = this.var_140.getValue(_loc6_.id) == null;
            _loc8_ = this.var_538.indexOf(_loc6_.id) == -1;
            if(this.var_323.indexOf(_loc6_.id) != -1)
            {
               this.var_323.splice(this.var_323.indexOf(_loc6_.id),1);
            }
            if(!_loc8_)
            {
               this.var_538.splice(this.var_538.indexOf(_loc6_.id),1);
            }
            if(_loc7_)
            {
               if(_loc8_)
               {
                  _loc9_ = this.var_512.loadTraxSong(_loc6_.id,_loc6_.data);
                  if(_loc9_ == null)
                  {
                     return;
                  }
                  _loc10_ = new SongDataEntry(_loc6_.id,_loc6_.length,_loc6_.name,_loc6_.creator,_loc9_);
                  this.var_140.add(_loc6_.id,_loc10_);
                  _loc11_ = this.var_173[this.var_1000];
                  if(_loc9_.ready && _loc6_.id == _loc11_)
                  {
                     this.playSongObject(_loc11_,this.var_998[_loc11_]);
                  }
               }
               else
               {
                  _loc12_ = new SongDataEntry(_loc6_.id,_loc6_.length,_loc6_.name,_loc6_.creator,null);
                  _loc12_.songData = _loc6_.data;
                  this.var_140.add(_loc6_.id,_loc12_);
               }
               this._events.dispatchEvent(new SongInfoReceivedEvent(SongInfoReceivedEvent.TRAX_SONG_INFO_RECEIVED,_loc6_.id));
               Logger.log("Received song info : " + _loc6_.id);
            }
            _loc5_++;
         }
      }
      
      private function playSongObject(param1:int, param2:Number = -1) : Boolean
      {
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc3_:SongDataEntry = this.var_140.getValue(param1) as SongDataEntry;
         if(_loc3_ == null)
         {
            Logger.log("WARNING: Unable to find song entry id " + param1 + " that was supposed to be loaded.");
            return false;
         }
         var _loc4_:IHabboSound = _loc3_.soundObject;
         if(!_loc4_.ready)
         {
            return false;
         }
         _loc4_.volume = this.var_512.volume;
         if(param2 != const_1542)
         {
            _loc4_.position = param2;
            if(this.var_999.getKeys().indexOf(param1) != -1)
            {
               _loc6_ = new Date();
               _loc7_ = (_loc6_.getTime() - this.var_999[param1]) / 1000;
               _loc4_.position += _loc7_;
               this.var_999.remove(param1);
            }
         }
         _loc4_.play();
         if(_loc3_.length >= 8000)
         {
            this.var_512.notifyPlayedSong(_loc3_.name,_loc3_.creator);
         }
         Logger.log("Started playing song : " + param1 + " at position : " + _loc4_.position);
         return true;
      }
      
      private function getTopPriority() : int
      {
         var _loc2_:int = 0;
         var _loc1_:int = -1;
         for each(_loc2_ in this.var_173.getKeys())
         {
            if(_loc2_ > _loc1_)
            {
               _loc1_ = _loc2_;
            }
         }
         return _loc1_;
      }
      
      private function onSongDiskInventoryMessage(param1:IMessageEvent) : void
      {
         var _loc2_:UserSongDisksInventoryMessageEvent = param1 as UserSongDisksInventoryMessageEvent;
         var _loc3_:UserSongDisksInventoryMessageParser = _loc2_.getParser() as UserSongDisksInventoryMessageParser;
         this.var_1673 = _loc3_.songDiskInventory;
         this._events.dispatchEvent(new SongDiskInventoryReceivedEvent(SongDiskInventoryReceivedEvent.const_1644));
      }
      
      private function onSoundMachineInit(param1:Event) : void
      {
         this.var_450 = new SoundMachinePlayListController(this.var_512,this,this._events,this.var_83,this._connection) as IPlayListController;
      }
      
      private function onSoundMachineDispose(param1:Event) : void
      {
         this.var_450.dispose();
         this.var_450 = null;
      }
      
      private function onJukeboxInit(param1:Event) : void
      {
         this.var_450 = new JukeboxPlayListController(this.var_512,this,this._events,this.var_83,this._connection) as IPlayListController;
      }
      
      private function onJukeboxDispose(param1:Event) : void
      {
         this.var_450.dispose();
         this.var_450 = null;
      }
   }
}
