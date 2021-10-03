package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_545:uint = 0;
      
      public static const const_1498:uint = 1;
      
      public static const const_1873:int = 0;
      
      public static const const_1991:int = 1;
      
      public static const const_1890:int = 2;
      
      public static const const_1861:int = 3;
      
      public static const const_1623:int = 4;
      
      public static const const_343:int = 5;
      
      public static var var_396:IEventQueue;
      
      private static var var_572:IEventProcessor;
      
      private static var var_1593:uint = const_545;
      
      private static var stage:Stage;
      
      private static var var_157:IWindowRenderer;
       
      
      private var var_2145:EventProcessorState;
      
      private var var_2143:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_215:DisplayObjectContainer;
      
      protected var var_2893:Boolean = true;
      
      protected var var_1291:Error;
      
      protected var var_2068:int = -1;
      
      protected var var_1292:IInternalWindowServices;
      
      protected var var_1557:IWindowParser;
      
      protected var var_2833:IWindowFactory;
      
      protected var var_146:IDesktopWindow;
      
      protected var var_1558:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_560:Boolean = false;
      
      private var var_2144:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_157 = param2;
         this._localization = param4;
         this.var_215 = param5;
         this.var_1292 = new ServiceManager(this,param5);
         this.var_2833 = param3;
         this.var_1557 = new WindowParser(this);
         this.var_2143 = param7;
         if(!stage)
         {
            if(this.var_215 is Stage)
            {
               stage = this.var_215 as Stage;
            }
            else if(this.var_215.stage)
            {
               stage = this.var_215.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_146 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_215.addChild(this.var_146.getDisplayObject());
         this.var_215.doubleClickEnabled = true;
         this.var_215.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2145 = new EventProcessorState(var_157,this.var_146,this.var_146,null,this.var_2143);
         inputMode = const_545;
         this.var_1558 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1593;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_396)
         {
            if(var_396 is IDisposable)
            {
               IDisposable(var_396).dispose();
            }
         }
         if(var_572)
         {
            if(var_572 is IDisposable)
            {
               IDisposable(var_572).dispose();
            }
         }
         switch(value)
         {
            case const_545:
               var_396 = new MouseEventQueue(stage);
               var_572 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1498:
               var_396 = new TabletEventQueue(stage);
               var_572 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_545;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_215.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_215.removeChild(IGraphicContextHost(this.var_146).getGraphicContext(true) as DisplayObject);
            this.var_146.destroy();
            this.var_146 = null;
            this.var_1558.destroy();
            this.var_1558 = null;
            if(this.var_1292 is IDisposable)
            {
               IDisposable(this.var_1292).dispose();
            }
            this.var_1292 = null;
            this.var_1557.dispose();
            this.var_1557 = null;
            var_157 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1291;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2068;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1291 = param2;
         this.var_2068 = param1;
         if(this.var_2893)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1291 = null;
         this.var_2068 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1292;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1557;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2833;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_146;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_146.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1623,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1558;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_146,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_146)
         {
            this.var_146 = null;
         }
         if(param1.state != WindowState.const_528)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_157.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_560 = true;
         if(this.var_1291)
         {
            throw this.var_1291;
         }
         var_572.process(this.var_2145,var_396);
         this.var_560 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2144 = true;
         var_157.update(param1);
         this.var_2144 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_146 != null && !this.var_146.disposed)
         {
            if(this.var_215 is Stage)
            {
               this.var_146.width = Stage(this.var_215).stageWidth;
               this.var_146.height = Stage(this.var_215).stageHeight;
            }
            else
            {
               this.var_146.width = this.var_215.width;
               this.var_146.height = this.var_215.height;
            }
         }
      }
   }
}
