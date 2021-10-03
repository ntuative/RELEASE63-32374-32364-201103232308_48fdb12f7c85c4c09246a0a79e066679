package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_306:int = -2.147483648E9;
      
      private var var_309:int = 2.147483647E9;
      
      private var var_308:int = -2.147483648E9;
      
      private var var_307:int = 2.147483647E9;
      
      private var _target:IWindow;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         this._target = param1;
      }
      
      public function get minWidth() : int
      {
         return this.var_306;
      }
      
      public function get maxWidth() : int
      {
         return this.var_309;
      }
      
      public function get minHeight() : int
      {
         return this.var_308;
      }
      
      public function get maxHeight() : int
      {
         return this.var_307;
      }
      
      public function set minWidth(param1:int) : void
      {
         this.var_306 = param1;
         if(this.var_306 > int.MIN_VALUE && !this._target.disposed && this._target.width < this.var_306)
         {
            this._target.width = this.var_306;
         }
      }
      
      public function set maxWidth(param1:int) : void
      {
         this.var_309 = param1;
         if(this.var_309 < int.MAX_VALUE && !this._target.disposed && this._target.width > this.var_309)
         {
            this._target.width = this.var_309;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         this.var_308 = param1;
         if(this.var_308 > int.MIN_VALUE && !this._target.disposed && this._target.height < this.var_308)
         {
            this._target.height = this.var_308;
         }
      }
      
      public function set maxHeight(param1:int) : void
      {
         this.var_307 = param1;
         if(this.var_307 < int.MAX_VALUE && !this._target.disposed && this._target.height > this.var_307)
         {
            this._target.height = this.var_307;
         }
      }
      
      public function get isEmpty() : Boolean
      {
         return this.var_306 == int.MIN_VALUE && this.var_309 == int.MAX_VALUE && this.var_308 == int.MIN_VALUE && this.var_307 == int.MAX_VALUE;
      }
      
      public function setEmpty() : void
      {
         this.var_306 = int.MIN_VALUE;
         this.var_309 = int.MAX_VALUE;
         this.var_308 = int.MIN_VALUE;
         this.var_307 = int.MAX_VALUE;
      }
      
      public function limit() : void
      {
         if(!this.isEmpty && this._target)
         {
            if(this._target.width < this.var_306)
            {
               this._target.width = this.var_306;
            }
            else if(this._target.width > this.var_309)
            {
               this._target.width = this.var_309;
            }
            if(this._target.height < this.var_308)
            {
               this._target.height = this.var_308;
            }
            else if(this._target.height > this.var_307)
            {
               this._target.height = this.var_307;
            }
         }
      }
      
      public function assign(param1:int, param2:int, param3:int, param4:int) : void
      {
         this.var_306 = param1;
         this.var_309 = param2;
         this.var_308 = param3;
         this.var_307 = param4;
         this.limit();
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_306 = this.var_306;
         _loc2_.var_309 = this.var_309;
         _loc2_.var_308 = this.var_308;
         _loc2_.var_307 = this.var_307;
         return _loc2_;
      }
   }
}
