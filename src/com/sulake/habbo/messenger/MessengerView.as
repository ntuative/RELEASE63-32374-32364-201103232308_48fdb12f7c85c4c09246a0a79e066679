package com.sulake.habbo.messenger
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.friendlist.SendMsgMessageComposer;
   import com.sulake.habbo.messenger.domain.Conversation;
   import com.sulake.habbo.messenger.domain.Message;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   
   public class MessengerView implements IDisposable
   {
       
      
      private var var_137:HabboMessenger;
      
      private var var_992:ConversationsTabView;
      
      private var var_957:ITextFieldWindow;
      
      private var var_17:IFrameWindow;
      
      private var var_1482:ConversationView;
      
      private var var_479:Timer;
      
      private var _disposed:Boolean = false;
      
      public function MessengerView(param1:HabboMessenger)
      {
         super();
         this.var_137 = param1;
         this.var_479 = new Timer(300,1);
         this.var_479.addEventListener(TimerEvent.TIMER,this.onResizeTimer);
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            if(this.var_479)
            {
               this.var_479.stop();
               this.var_479.removeEventListener(TimerEvent.TIMER,this.onResizeTimer);
               this.var_479 = null;
            }
            this.var_137 = null;
            this._disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function isMessengerOpen() : Boolean
      {
         return this.var_17 != null && this.var_17.visible;
      }
      
      public function close() : void
      {
         if(this.var_17 != null)
         {
            this.var_17.visible = false;
         }
      }
      
      public function openMessenger() : void
      {
         if(this.var_137.conversations.openConversations.length < 1)
         {
            return;
         }
         if(this.var_17 == null)
         {
            this.prepareContent();
            this.refresh();
            this.var_137.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_55,HabboToolbarIconEnum.MESSENGER,this.var_17));
         }
         else
         {
            this.refresh();
            this.var_17.visible = true;
            this.var_17.activate();
         }
      }
      
      public function refresh() : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         var _loc1_:Conversation = this.var_137.conversations.findSelectedConversation();
         this.var_17.caption = _loc1_ == null ? "" : _loc1_.name;
         this.var_992.refresh();
         this.var_1482.refresh();
         if(this.var_137.conversations.openConversations.length < 1)
         {
            this.var_17.visible = false;
            this.var_137.setHabboToolbarIcon(false,false);
         }
      }
      
      public function addMsgToView(param1:Conversation, param2:Message) : void
      {
         if(this.var_17 == null)
         {
            return;
         }
         if(!param1.selected)
         {
            return;
         }
         this.var_1482.addMessage(param2);
      }
      
      private function prepareContent() : void
      {
         this.var_17 = IFrameWindow(this.var_137.getXmlWindow("main_window"));
         var _loc1_:IWindow = this.var_17.findChildByTag("close");
         _loc1_.procedure = this.onWindowClose;
         this.var_17.procedure = this.onWindow;
         this.var_17.title.color = 4294623744;
         this.var_17.title.textColor = 4287851525;
         this.var_992 = new ConversationsTabView(this.var_137,this.var_17);
         this.var_992.refresh();
         this.var_957 = ITextFieldWindow(this.var_17.findChildByName("message_input"));
         this.var_957.addEventListener(WindowKeyboardEvent.const_198,this.onMessageInput);
         this.var_1482 = new ConversationView(this.var_137,this.var_17);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_753,false);
         this.var_17.scaler.setParamFlag(HabboWindowParam.const_1061,true);
      }
      
      private function onMessageInput(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = param1 as WindowKeyboardEvent;
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            this.sendMsg();
         }
         else
         {
            _loc4_ = 120;
            _loc5_ = this.var_957.text;
            if(_loc5_.length > _loc4_)
            {
               this.var_957.text = _loc5_.substring(0,_loc4_);
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_47 || param2 != this.var_17)
         {
            return;
         }
         if(!this.var_479.running)
         {
            this.var_479.reset();
            this.var_479.start();
         }
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         Logger.log("XXX RESIZE XXX");
         this.var_1482.afterResize();
         this.var_992.refresh();
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.var_17.visible = false;
      }
      
      private function sendMsg() : void
      {
         var _loc1_:String = this.var_957.text;
         Logger.log("Send msg: " + _loc1_);
         if(_loc1_ == "")
         {
            Logger.log("No text...");
            return;
         }
         var _loc2_:Conversation = this.var_137.conversations.findSelectedConversation();
         if(_loc2_ == null)
         {
            Logger.log("No conversation...");
            return;
         }
         this.var_137.send(new SendMsgMessageComposer(_loc2_.id,_loc1_));
         if(_loc2_.messages.length == 1)
         {
            this.var_137.playSendSound();
         }
         this.var_957.text = "";
         this.var_137.conversations.addMessageAndUpdateView(new Message(Message.const_919,_loc2_.id,_loc1_,Util.getFormattedNow()));
      }
      
      public function getTabCount() : int
      {
         return this.var_992 == null ? 7 : int(this.var_992.getTabCount());
      }
   }
}
