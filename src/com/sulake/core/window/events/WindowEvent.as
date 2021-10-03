package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_1701:String = "WE_CREATE";
      
      public static const const_1459:String = "WE_CREATED";
      
      public static const const_1628:String = "WE_DESTROY";
      
      public static const const_287:String = "WE_DESTROYED";
      
      public static const const_1552:String = "WE_OPEN";
      
      public static const const_1654:String = "WE_OPENED";
      
      public static const const_1494:String = "WE_CLOSE";
      
      public static const const_1473:String = "WE_CLOSED";
      
      public static const const_1445:String = "WE_FOCUS";
      
      public static const const_295:String = "WE_FOCUSED";
      
      public static const const_1716:String = "WE_UNFOCUS";
      
      public static const const_1577:String = "WE_UNFOCUSED";
      
      public static const const_1493:String = "WE_ACTIVATE";
      
      public static const const_1657:String = "WE_ACTIVATED";
      
      public static const const_1652:String = "WE_DEACTIVATE";
      
      public static const const_495:String = "WE_DEACTIVATED";
      
      public static const const_469:String = "WE_SELECT";
      
      public static const const_61:String = "WE_SELECTED";
      
      public static const const_880:String = "WE_UNSELECT";
      
      public static const const_887:String = "WE_UNSELECTED";
      
      public static const const_1853:String = "WE_ATTACH";
      
      public static const const_1886:String = "WE_ATTACHED";
      
      public static const const_1800:String = "WE_DETACH";
      
      public static const const_1820:String = "WE_DETACHED";
      
      public static const const_1513:String = "WE_LOCK";
      
      public static const const_1640:String = "WE_LOCKED";
      
      public static const const_1457:String = "WE_UNLOCK";
      
      public static const const_1582:String = "WE_UNLOCKED";
      
      public static const const_696:String = "WE_ENABLE";
      
      public static const const_296:String = "WE_ENABLED";
      
      public static const const_715:String = "WE_DISABLE";
      
      public static const const_258:String = "WE_DISABLED";
      
      public static const const_1528:String = "WE_RELOCATE";
      
      public static const const_401:String = "WE_RELOCATED";
      
      public static const const_1475:String = "WE_RESIZE";
      
      public static const const_47:String = "WE_RESIZED";
      
      public static const WINDOW_EVENT_MINIMIZE:String = "WE_MINIMIZE";
      
      public static const const_1665:String = "WE_MINIMIZED";
      
      public static const const_1626:String = "WE_MAXIMIZE";
      
      public static const const_1536:String = "WE_MAXIMIZED";
      
      public static const const_1708:String = "WE_RESTORE";
      
      public static const const_1680:String = "WE_RESTORED";
      
      public static const const_1952:String = "WE_ARRANGE";
      
      public static const const_1987:String = "WE_ARRANGED";
      
      public static const const_107:String = "WE_UPDATE";
      
      public static const const_2016:String = "WE_UPDATED";
      
      public static const const_1923:String = "WE_CHILD_RELOCATE";
      
      public static const const_530:String = "WE_CHILD_RELOCATED";
      
      public static const const_1912:String = "WE_CHILD_RESIZE";
      
      public static const const_317:String = "WE_CHILD_RESIZED";
      
      public static const const_1914:String = "WE_CHILD_REMOVE";
      
      public static const const_459:String = "WE_CHILD_REMOVED";
      
      public static const const_2005:String = "WE_PARENT_RELOCATE";
      
      public static const const_1856:String = "WE_PARENT_RELOCATED";
      
      public static const const_1798:String = "WE_PARENT_RESIZE";
      
      public static const const_1472:String = "WE_PARENT_RESIZED";
      
      public static const const_182:String = "WE_OK";
      
      public static const const_897:String = "WE_CANCEL";
      
      public static const const_103:String = "WE_CHANGE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_558:String = "WE_SCROLL";
      
      public static const const_159:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String = "";
      
      protected var _window:IWindow;
      
      protected var var_466:IWindow;
      
      protected var var_1564:Boolean;
      
      protected var var_1563:Boolean;
      
      private var var_1796:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow = null, param3:IWindow = null, param4:Boolean = false)
      {
         this._type = param1;
         this._window = param2;
         this.var_466 = param3;
         this.var_1564 = false;
         this.var_1563 = param4;
         super(param1);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = false ? POOL.pop() : new WindowEvent(param1);
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_466 = param3;
         _loc5_.var_1563 = param4;
         _loc5_.var_1796 = false;
         return _loc5_;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      override public function get type() : String
      {
         return this._type;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_466;
      }
      
      override public function get cancelable() : Boolean
      {
         return this.var_1563;
      }
      
      public function recycle() : void
      {
         if(this.var_1796)
         {
            throw new Error("Event already recycled!");
         }
         this._type = null;
         this.var_466 = null;
         this._window = null;
         this.var_1796 = true;
         this.var_1564 = false;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1564 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1564;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","cancelable","window");
      }
   }
}
