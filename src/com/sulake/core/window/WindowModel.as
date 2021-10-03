package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var var_11:Rectangle;
      
      protected var var_399:Rectangle;
      
      protected var var_62:Rectangle;
      
      protected var var_149:Rectangle;
      
      protected var var_150:Rectangle;
      
      protected var var_73:WindowRectLimits;
      
      protected var _context:WindowContext;
      
      protected var var_465:Boolean = false;
      
      protected var var_239:uint = 16777215;
      
      protected var var_558:uint;
      
      protected var var_464:uint = 10;
      
      protected var var_686:Boolean = true;
      
      protected var var_304:Boolean = true;
      
      protected var var_801:Number = 1.0;
      
      protected var var_19:uint;
      
      protected var _state:uint;
      
      protected var var_84:uint;
      
      protected var _type:uint;
      
      protected var var_20:String = "";
      
      protected var _name:String;
      
      protected var _id:uint;
      
      protected var var_846:Array;
      
      protected var _disposed:Boolean = false;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._type = param3;
         this.var_19 = param5;
         this._state = WindowState.const_99;
         this.var_84 = param4;
         this.var_846 = param8 == null ? new Array() : param8;
         this._context = param6;
         this.var_11 = param7.clone();
         this.var_399 = param7.clone();
         this.var_62 = param7.clone();
         this.var_149 = new Rectangle();
         this.var_150 = null;
         this.var_73 = new WindowRectLimits(this as IWindow);
      }
      
      public function get x() : int
      {
         return this.var_11.x;
      }
      
      public function get y() : int
      {
         return this.var_11.y;
      }
      
      public function get width() : int
      {
         return this.var_11.width;
      }
      
      public function get height() : int
      {
         return this.var_11.height;
      }
      
      public function get position() : Point
      {
         return this.var_11.topLeft;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_11;
      }
      
      public function get limits() : IRectLimiter
      {
         return this.var_73;
      }
      
      public function get context() : IWindowContext
      {
         return this._context;
      }
      
      public function get mouseThreshold() : uint
      {
         return this.var_464;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get background() : Boolean
      {
         return this.var_465;
      }
      
      public function get clipping() : Boolean
      {
         return this.var_686;
      }
      
      public function get visible() : Boolean
      {
         return this.var_304;
      }
      
      public function get color() : uint
      {
         return this.var_239;
      }
      
      public function get alpha() : uint
      {
         return this.var_558 >>> 24;
      }
      
      public function get blend() : Number
      {
         return this.var_801;
      }
      
      public function get param() : uint
      {
         return this.var_19;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function get style() : uint
      {
         return this.var_84;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get caption() : String
      {
         return this.var_20;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function get tags() : Array
      {
         return this.var_846;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_11 = null;
            this._context = null;
            this._state = WindowState.const_528;
            this.var_846 = null;
         }
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function getInitialWidth() : int
      {
         return this.var_399.width;
      }
      
      public function getInitialHeight() : int
      {
         return this.var_399.height;
      }
      
      public function getPreviousWidth() : int
      {
         return this.var_62.width;
      }
      
      public function getPreviousHeight() : int
      {
         return this.var_62.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return this.var_149.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return this.var_149.height;
      }
      
      public function getMaximizedWidth() : int
      {
         return this.var_150.width;
      }
      
      public function getMaximizedHeight() : int
      {
         return this.var_150.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return this.var_73.maxWidth < int.MAX_VALUE;
      }
      
      public function getMaxWidth() : int
      {
         return this.var_73.maxWidth;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = this.var_73.maxWidth;
         this.var_73.maxWidth = param1;
         return _loc2_;
      }
      
      public function hasMinWidth() : Boolean
      {
         return this.var_73.minWidth > int.MIN_VALUE;
      }
      
      public function getMinWidth() : int
      {
         return this.var_73.minWidth;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = this.var_73.minWidth;
         this.var_73.minWidth = param1;
         return _loc2_;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return this.var_73.maxHeight < int.MAX_VALUE;
      }
      
      public function getMaxHeight() : int
      {
         return this.var_73.maxHeight;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = this.var_73.maxHeight;
         this.var_73.maxHeight = param1;
         return _loc2_;
      }
      
      public function hasMinHeight() : Boolean
      {
         return this.var_73.minHeight > int.MIN_VALUE;
      }
      
      public function getMinHeight() : int
      {
         return this.var_73.minHeight;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = this.var_73.minHeight;
         this.var_73.minHeight = param1;
         return _loc2_;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._type & param2 ^ param1) == 0;
         }
         return (this._type & param1) == param1;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._state & param2 ^ param1) == 0;
         }
         return (this._state & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_84 & param2 ^ param1) == 0;
         }
         return (this.var_84 & param1) == param1;
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_19 & param2 ^ param1) == 0;
         }
         return (this.var_19 & param1) == param1;
      }
   }
}
