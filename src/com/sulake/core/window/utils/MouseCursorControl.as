package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_32;
      
      private static var var_133:Stage;
      
      private static var var_304:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_726:Boolean = true;
      
      private static var var_117:DisplayObject;
      
      private static var var_1386:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_133 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_117)
            {
               var_133.removeChild(var_117);
               var_133.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_133.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_133.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_133.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_726 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_304;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_304 = param1;
         if(var_304)
         {
            if(var_117)
            {
               var_117.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_117)
         {
            var_117.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_726)
         {
            _loc1_ = var_1386[_type];
            if(_loc1_)
            {
               if(var_117)
               {
                  var_133.removeChild(var_117);
               }
               else
               {
                  var_133.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_133.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_133.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_133.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_117 = _loc1_;
               var_133.addChild(var_117);
            }
            else
            {
               if(var_117)
               {
                  var_133.removeChild(var_117);
                  var_133.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_133.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_133.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_133.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_117 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_32:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_318:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_1486:
                  case MouseCursorType.const_194:
                  case MouseCursorType.const_1575:
                  case MouseCursorType.const_1508:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_726 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1386[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_117)
         {
            var_117.x = param1.stageX - 2;
            var_117.y = param1.stageY;
            if(_type == MouseCursorType.const_32)
            {
               var_304 = false;
               Mouse.show();
            }
            else
            {
               var_304 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_117 && _type != MouseCursorType.const_32)
         {
            Mouse.hide();
            var_304 = false;
         }
      }
   }
}
