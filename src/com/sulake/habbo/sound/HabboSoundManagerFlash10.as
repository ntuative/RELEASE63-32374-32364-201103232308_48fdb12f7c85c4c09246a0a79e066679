package com.sulake.habbo.sound
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.sound.SoundSettingsEvent;
   import com.sulake.habbo.communication.messages.outgoing.sound.GetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.outgoing.sound.SetSoundSettingsComposer;
   import com.sulake.habbo.communication.messages.parser.sound.SoundSettingsParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.notifications.IHabboNotifications;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.sound.events.TraxSongLoadEvent;
   import com.sulake.habbo.sound.music.HabboMusicController;
   import com.sulake.habbo.sound.object.HabboSound;
   import com.sulake.habbo.sound.trax.TraxData;
   import com.sulake.habbo.sound.trax.TraxSample;
   import com.sulake.habbo.sound.trax.TraxSequencer;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboNotifications;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   
   public class HabboSoundManagerFlash10 extends Component implements IHabboSoundManager
   {
       
      
      private var var_195:IHabboConfigurationManager;
      
      private var _communication:IHabboCommunicationManager;
      
      private var _connection:IConnection;
      
      private var _roomEngine:IRoomEngine;
      
      private var var_188:IHabboToolbar;
      
      private var var_1012:IHabboNotifications;
      
      private var _volume:Number = 1.0;
      
      private var var_664:Map;
      
      private var var_810:Map;
      
      private var var_1014:Map;
      
      private var var_811:int;
      
      private var var_1013:TraxSequencer;
      
      private var var_198:HabboMusicController;
      
      public function HabboSoundManagerFlash10(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_664 = new Map();
         this.var_810 = new Map();
         this.var_1014 = new Map();
         super(param1,param2,param3);
         queueInterface(new IIDHabboConfigurationManager(),this.onHabboConfigurationInit);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
         queueInterface(new IIDRoomEngine(),this.onRoomEngineReady);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
         queueInterface(new IIDHabboNotifications(),this.onNotificationsReady);
         events.addEventListener(TraxSongLoadEvent.const_1164,this.onTraxLoadComplete);
         Logger.log("Sound manager 10 init");
      }
      
      public function get musicController() : IHabboMusicController
      {
         return this.var_198;
      }
      
      public function get volume() : Number
      {
         return this._volume;
      }
      
      public function set volume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
         this.storeVolumeSetting();
      }
      
      public function set previewVolume(param1:Number) : void
      {
         this.updateVolumeSetting(param1);
      }
      
      override public function dispose() : void
      {
         this._connection = null;
         if(this.var_198)
         {
            this.var_198.dispose();
            this.var_198 = null;
         }
         if(this.var_810)
         {
            this.var_810.dispose();
            this.var_810 = null;
         }
         if(this.var_1014)
         {
            this.var_1014.dispose();
            this.var_1014 = null;
         }
         if(this.var_664)
         {
            this.var_664.dispose();
            this.var_664 = null;
         }
         if(this._communication)
         {
            this._communication.release(new IIDHabboCommunicationManager());
            this._communication = null;
         }
         if(this.var_195)
         {
            this.var_195.release(new IIDHabboConfigurationManager());
            this.var_195 = null;
         }
         if(this._roomEngine)
         {
            this._roomEngine.release(new IIDRoomEngine());
            this._roomEngine = null;
         }
         if(this.var_188)
         {
            this.var_188.release(new IIDHabboToolbar());
            this.var_188 = null;
         }
         if(this.var_1012)
         {
            this.var_1012.release(new IIDHabboNotifications());
            this.var_1012 = null;
         }
         super.dispose();
      }
      
      public function playSound(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc2_:HabboSound = this.var_1014.getValue(param1);
         if(_loc2_ == null)
         {
            _loc3_ = "";
            switch(param1)
            {
               case HabboSoundTypesEnum.const_1111:
                  _loc3_ = "sound_call_for_help";
                  break;
               case HabboSoundTypesEnum.const_1535:
                  _loc3_ = "sound_guide_received_invitation";
                  break;
               case HabboSoundTypesEnum.const_1126:
                  _loc3_ = "sound_console_new_message";
                  break;
               case HabboSoundTypesEnum.const_1118:
                  _loc3_ = "sound_console_message_sent";
                  break;
               case HabboSoundTypesEnum.const_1101:
                  _loc3_ = "sound_catalogue_pixels";
                  break;
               case HabboSoundTypesEnum.const_1036:
                  _loc3_ = "sound_catalogue_cash";
                  break;
               case HabboSoundTypesEnum.const_1550:
                  _loc3_ = "sound_respect_received";
                  break;
               default:
                  Logger.log("HabboSoundManagerFlash10: Unknown sound request: " + param1);
            }
            _loc4_ = assets.getAssetByName(_loc3_);
            _loc5_ = _loc4_.content as Sound;
            if(_loc5_ == null)
            {
               return;
            }
            _loc2_ = new HabboSound(_loc5_);
            this.var_1014.add(param1,_loc2_);
         }
         _loc2_.volume = this._volume;
         _loc2_.play();
      }
      
      public function loadSoundUrl(param1:String) : IHabboSound
      {
         var _loc2_:URLRequest = new URLRequest(param1);
         var _loc3_:Sound = new Sound();
         _loc3_.load(_loc2_);
         var _loc4_:HabboSound = new HabboSound(_loc3_);
         _loc4_.volume = this._volume;
         return _loc4_ as IHabboSound;
      }
      
      private function loadSample(param1:int) : void
      {
         if(this.var_195 == null)
         {
            return;
         }
         var _loc2_:String = this.var_195.getKey("flash.dynamic.download.url","furniture/");
         _loc2_ += this.var_195.getKey("flash.dynamic.download.samples.template","mp3/sound_machine_sample_%typeid%.mp3");
         _loc2_ = _loc2_.replace(/%typeid%/,param1.toString());
         var _loc3_:URLRequest = new URLRequest(_loc2_);
         var _loc4_:Sound = new Sound();
         _loc4_.addEventListener(Event.COMPLETE,this.onSampleLoadComplete);
         _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.ioErrorHandler);
         _loc4_.load(_loc3_);
         this.var_664.add(_loc4_,param1);
      }
      
      public function loadTraxSong(param1:int, param2:String) : IHabboSound
      {
         if(this.var_1013 != null)
         {
            return null;
         }
         var _loc3_:TraxData = new TraxData(param2);
         var _loc4_:Array = _loc3_.getSampleIds();
         var _loc5_:* = [];
         var _loc6_:Array = this.var_810.getKeys();
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length)
         {
            if(_loc6_.indexOf(int(_loc4_[_loc7_])) == -1)
            {
               _loc5_.push(int(_loc4_[_loc7_]));
               this.loadSample(int(_loc4_[_loc7_]));
            }
            _loc7_++;
         }
         var _loc8_:TraxSequencer = new TraxSequencer(param1,_loc3_,this.var_810,events);
         _loc8_.volume = this._volume;
         this.var_1013 = null;
         this.var_811 = -1;
         if(_loc5_.length != 0)
         {
            _loc8_.ready = false;
            this.var_1013 = _loc8_;
            this.var_811 = param1;
         }
         return _loc8_ as IHabboSound;
      }
      
      public function notifyPlayedSong(param1:String, param2:String) : void
      {
         if(this.var_1012 == null)
         {
            return;
         }
         this.var_1012.addSongPlayingNotification(param1,param2);
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this.var_195 = param2 as IHabboConfigurationManager;
         }
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            this._communication = IHabboCommunicationManager(param2);
            this._communication.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
         }
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this._communication.getHabboMainConnection(this.onConnectionReady);
         if(_loc2_ != null)
         {
            _loc2_.addMessageEvent(new SoundSettingsEvent(this.onSoundSettingsEvent));
            _loc2_.send(new GetSoundSettingsComposer());
            this.onConnectionReady(_loc2_);
            this.initMusicController();
         }
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this._roomEngine = IRoomEngine(param2);
         this.initMusicController();
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_188 = IHabboToolbar(param2);
         this.var_188.events.addEventListener(HabboToolbarEvent.const_70,this.onHabboToolbarEvent);
         this.var_188.events.addEventListener(HabboToolbarEvent.const_38,this.onHabboToolbarEvent);
      }
      
      private function onNotificationsReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 == null)
         {
            return;
         }
         this.var_1012 = IHabboNotifications(param2);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            this._connection = param1;
         }
         this.initMusicController();
      }
      
      private function initMusicController() : void
      {
         if(this.var_195 == null || this._connection == null || this._roomEngine == null || this.var_198 != null)
         {
            return;
         }
         this.var_198 = new HabboMusicController(this,events,this._roomEngine.events,this._connection);
      }
      
      private function onSampleLoadComplete(param1:Event) : void
      {
         var _loc7_:int = 0;
         var _loc2_:Sound = param1.target as Sound;
         var _loc3_:int = this.var_664.getValue(_loc2_);
         var _loc4_:ByteArray = new ByteArray();
         var _loc5_:Number = _loc2_.length;
         _loc2_.extract(_loc4_,int(_loc5_ * 44.1));
         var _loc6_:TraxSample = new TraxSample(_loc4_,_loc3_);
         this.var_664.remove(_loc2_);
         this.var_810.add(_loc3_,_loc6_);
         if(this.var_664.length == 0 && this.var_811 != -1)
         {
            this.var_1013.ready = true;
            _loc7_ = this.var_811;
            this.var_811 = -1;
            this.var_1013 = null;
            events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1164,_loc7_));
         }
      }
      
      private function onTraxLoadComplete(param1:Event) : void
      {
         var _loc2_:TraxSongLoadEvent = param1 as TraxSongLoadEvent;
         if(_loc2_ == null)
         {
            return;
         }
         if(this.var_198 == null)
         {
            return;
         }
         this.var_198.onSongLoaded(_loc2_.id);
      }
      
      private function ioErrorHandler(param1:Event) : void
      {
         events.dispatchEvent(new TraxSongLoadEvent(TraxSongLoadEvent.const_1479,this.var_811));
         this.var_811 = -1;
         this.var_1013 = null;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_70)
         {
            this.setHabboToolbarIconState(this._volume > 0);
            return;
         }
         if(param1.type == HabboToolbarEvent.const_38)
         {
            if(param1.iconId == HabboToolbarIconEnum.SOUNDS)
            {
               if(this._volume == 1)
               {
                  this.updateVolumeSetting(0);
               }
               else
               {
                  this.updateVolumeSetting(1);
               }
               this.storeVolumeSetting();
            }
         }
      }
      
      private function storeVolumeSetting() : void
      {
         if(this._connection != null)
         {
            this._connection.send(new SetSoundSettingsComposer(int(this._volume * 100)));
         }
      }
      
      private function updateVolumeSetting(param1:Number) : void
      {
         this._volume = param1;
         this.var_198.updateVolume(this._volume);
         this.setHabboToolbarIconState(param1 > 0);
      }
      
      private function onSoundSettingsEvent(param1:IMessageEvent) : void
      {
         var _loc2_:SoundSettingsEvent = param1 as SoundSettingsEvent;
         var _loc3_:SoundSettingsParser = _loc2_.getParser() as SoundSettingsParser;
         if(_loc3_.volume == 1 || _loc3_.volume == 0)
         {
            this.updateVolumeSetting(_loc3_.volume * 1);
         }
         else
         {
            this.updateVolumeSetting(_loc3_.volume / 100);
         }
      }
      
      private function setHabboToolbarIconState(param1:Boolean) : void
      {
         if(this.var_188 == null)
         {
            return;
         }
         var _loc2_:HabboToolbarSetIconEvent = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_91,HabboToolbarIconEnum.SOUNDS);
         _loc2_.iconState = !!param1 ? "1" : "0";
         this.var_188.events.dispatchEvent(_loc2_);
      }
   }
}
