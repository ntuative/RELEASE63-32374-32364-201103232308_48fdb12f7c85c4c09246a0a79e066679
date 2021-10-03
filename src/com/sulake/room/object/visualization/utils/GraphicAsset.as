package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_1833:String;
      
      private var var_2250:String;
      
      private var var_456:BitmapDataAsset;
      
      private var var_1356:Boolean;
      
      private var var_1355:Boolean;
      
      private var var_2249:Boolean;
      
      private var _offsetX:int;
      
      private var var_1219:int;
      
      private var var_273:int;
      
      private var _height:int;
      
      private var var_829:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_1833 = param1;
         this.var_2250 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_456 = _loc9_;
            this.var_829 = false;
         }
         else
         {
            this.var_456 = null;
            this.var_829 = true;
         }
         this.var_1356 = param4;
         this.var_1355 = param5;
         this._offsetX = param6;
         this.var_1219 = param7;
         this.var_2249 = param8;
      }
      
      public function dispose() : void
      {
         this.var_456 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_829 && this.var_456 != null)
         {
            _loc1_ = this.var_456.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_273 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_829 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1355;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1356;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_273;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_1833;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2250;
      }
      
      public function get asset() : IAsset
      {
         return this.var_456;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2249;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1356)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1355)
         {
            return this.var_1219;
         }
         return -(this.height + this.var_1219);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1219;
      }
   }
}
