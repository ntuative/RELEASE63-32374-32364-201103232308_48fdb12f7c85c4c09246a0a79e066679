package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.IBitmapDataContainer;
   import com.sulake.core.window.utils.PropertyDefaults;
   import com.sulake.core.window.utils.PropertyStruct;
   import flash.display.BitmapData;
   import flash.geom.Rectangle;
   
   public class BitmapWrapperController extends WindowController implements IBitmapWrapperWindow, IBitmapDataContainer
   {
       
      
      protected var _bitmapData:BitmapData;
      
      protected var var_557:Boolean = true;
      
      protected var var_845:String;
      
      public function BitmapWrapperController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
      }
      
      public function get bitmap() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmap(param1:BitmapData) : void
      {
         if(this.var_557 && this._bitmapData && param1 != this._bitmapData)
         {
            this._bitmapData.dispose();
         }
         this._bitmapData = param1;
         _context.invalidate(this,var_11,WindowRedrawFlag.REDRAW);
      }
      
      public function get bitmapData() : BitmapData
      {
         return this._bitmapData;
      }
      
      public function set bitmapData(param1:BitmapData) : void
      {
         this.bitmap = param1;
      }
      
      public function get bitmapAssetName() : String
      {
         return this.var_845;
      }
      
      public function set bitmapAssetName(param1:String) : void
      {
         this.var_845 = param1;
      }
      
      public function get disposesBitmap() : Boolean
      {
         return this.var_557;
      }
      
      public function set disposesBitmap(param1:Boolean) : void
      {
         this.var_557 = param1;
      }
      
      override public function clone() : IWindow
      {
         var _loc1_:BitmapWrapperController = super.clone() as BitmapWrapperController;
         _loc1_._bitmapData = this._bitmapData;
         _loc1_.var_557 = this.var_557;
         _loc1_.var_845 = this.var_845;
         return _loc1_;
      }
      
      override public function dispose() : void
      {
         if(this._bitmapData)
         {
            if(this.var_557)
            {
               this._bitmapData.dispose();
            }
            this._bitmapData = null;
         }
         super.dispose();
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         if(this.var_557 != PropertyDefaults.const_1154)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_773,this.var_557,PropertyStruct.const_37,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1531);
         }
         if(this.var_845 != PropertyDefaults.const_1099)
         {
            _loc1_.push(new PropertyStruct(PropertyDefaults.const_861,this.var_845,PropertyStruct.const_56,true));
         }
         else
         {
            _loc1_.push(PropertyDefaults.const_1695);
         }
         return _loc1_;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in param1)
         {
            switch(_loc2_.key)
            {
               case PropertyDefaults.const_773:
                  this.var_557 = _loc2_.value as Boolean;
                  break;
               case PropertyDefaults.const_861:
                  this.var_845 = _loc2_.value as String;
                  break;
            }
         }
         super.properties = param1;
      }
   }
}
