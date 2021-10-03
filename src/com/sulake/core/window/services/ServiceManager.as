package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_2878:uint;
      
      private var var_148:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_266:IWindowContext;
      
      private var var_1213:IMouseDraggingService;
      
      private var var_1210:IMouseScalingService;
      
      private var var_1215:IMouseListenerService;
      
      private var var_1211:IFocusManagerService;
      
      private var var_1212:IToolTipAgentService;
      
      private var var_1214:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2878 = 0;
         this.var_148 = param2;
         this.var_266 = param1;
         this.var_1213 = new WindowMouseDragger(param2);
         this.var_1210 = new WindowMouseScaler(param2);
         this.var_1215 = new WindowMouseListener(param2);
         this.var_1211 = new FocusManager(param2);
         this.var_1212 = new WindowToolTipAgent(param2);
         this.var_1214 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1213 != null)
         {
            this.var_1213.dispose();
            this.var_1213 = null;
         }
         if(this.var_1210 != null)
         {
            this.var_1210.dispose();
            this.var_1210 = null;
         }
         if(this.var_1215 != null)
         {
            this.var_1215.dispose();
            this.var_1215 = null;
         }
         if(this.var_1211 != null)
         {
            this.var_1211.dispose();
            this.var_1211 = null;
         }
         if(this.var_1212 != null)
         {
            this.var_1212.dispose();
            this.var_1212 = null;
         }
         if(this.var_1214 != null)
         {
            this.var_1214.dispose();
            this.var_1214 = null;
         }
         this.var_148 = null;
         this.var_266 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1213;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1210;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1215;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1211;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1212;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1214;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
