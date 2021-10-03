package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1518:String = "WN_CRETAE";
      
      public static const const_1725:String = "WN_CREATED";
      
      public static const const_1085:String = "WN_DESTROY";
      
      public static const const_1035:String = "WN_DESTROYED";
      
      public static const const_1082:String = "WN_OPEN";
      
      public static const const_1144:String = "WN_OPENED";
      
      public static const const_1096:String = "WN_CLOSE";
      
      public static const const_1089:String = "WN_CLOSED";
      
      public static const const_1046:String = "WN_FOCUS";
      
      public static const const_1145:String = "WN_FOCUSED";
      
      public static const const_1021:String = "WN_UNFOCUS";
      
      public static const const_1177:String = "WN_UNFOCUSED";
      
      public static const const_1233:String = "WN_ACTIVATE";
      
      public static const const_387:String = "WN_ACTVATED";
      
      public static const const_1064:String = "WN_DEACTIVATE";
      
      public static const const_1070:String = "WN_DEACTIVATED";
      
      public static const const_569:String = "WN_SELECT";
      
      public static const const_344:String = "WN_SELECTED";
      
      public static const const_878:String = "WN_UNSELECT";
      
      public static const const_748:String = "WN_UNSELECTED";
      
      public static const const_1190:String = "WN_LOCK";
      
      public static const const_1122:String = "WN_LOCKED";
      
      public static const const_1222:String = "WN_UNLOCK";
      
      public static const const_1017:String = "WN_UNLOCKED";
      
      public static const const_1028:String = "WN_ENABLE";
      
      public static const const_770:String = "WN_ENABLED";
      
      public static const const_1249:String = "WN_DISABLE";
      
      public static const const_800:String = "WN_DISABLED";
      
      public static const const_847:String = "WN_RESIZE";
      
      public static const const_178:String = "WN_RESIZED";
      
      public static const const_1097:String = "WN_RELOCATE";
      
      public static const const_555:String = "WN_RELOCATED";
      
      public static const const_1218:String = "WN_MINIMIZE";
      
      public static const const_1224:String = "WN_MINIMIZED";
      
      public static const const_1193:String = "WN_MAXIMIZE";
      
      public static const const_1100:String = "WN_MAXIMIZED";
      
      public static const const_1174:String = "WN_RESTORE";
      
      public static const const_1226:String = "WN_RESTORED";
      
      public static const const_350:String = "WN_CHILD_ADDED";
      
      public static const const_801:String = "WN_CHILD_REMOVED";
      
      public static const const_308:String = "WN_CHILD_RESIZED";
      
      public static const const_281:String = "WN_CHILD_RELOCATED";
      
      public static const WINDOW_NOTIFY_CHILD_ACTIVATED:String = "WN_CHILD_ACTIVATED";
      
      public static const const_437:String = "WN_PARENT_ADDED";
      
      public static const const_1192:String = "WN_PARENT_REMOVED";
      
      public static const const_547:String = "WN_PARENT_RESIZED";
      
      public static const const_1026:String = "WN_PARENT_RELOCATED";
      
      public static const const_885:String = "WN_PARENT_ACTIVATED";
      
      public static const const_506:String = "WN_STATE_UPDATED";
      
      public static const const_511:String = "WN_STYLE_UPDATED";
      
      public static const const_448:String = "WN_PARAM_UPDATED";
      
      public static const UNKNOWN:String = "UNKNOWN";
      
      private static const POOL:Array = [];
       
      
      private var _isRecycled:Boolean;
      
      public function WindowNotifyEvent()
      {
         super("",null,null);
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowNotifyEvent
      {
         var _loc5_:WindowNotifyEvent = false ? POOL.pop() : new WindowNotifyEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_466 = param3;
         _loc5_.var_1563 = param4;
         _loc5_._isRecycled = false;
         return _loc5_;
      }
      
      override public function recycle() : void
      {
         if(this._isRecycled)
         {
            throw new Error("Event already recycled!");
         }
         _type = null;
         var_466 = null;
         _window = null;
         this._isRecycled = true;
         POOL.push(this);
      }
      
      override public function clone() : Event
      {
         return allocate(type,_window,var_466,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
   }
}
