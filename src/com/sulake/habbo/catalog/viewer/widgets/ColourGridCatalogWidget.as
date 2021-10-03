package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColourIndexEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetMultiColoursEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ColourGridCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_912:Array;
      
      private var var_355:IItemGridWindow;
      
      private var var_1714:XML;
      
      private var var_599:BitmapData;
      
      private var var_913:BitmapData;
      
      private var var_911:BitmapData;
      
      private var var_340:IWindowContainer;
      
      public function ColourGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      override public function dispose() : void
      {
         if(!this.var_355.disposed)
         {
            this.var_355.destroyGridItems();
            this.var_355.dispose();
         }
         this.var_355 = null;
         this.var_1714 = null;
         this.var_340 = null;
         events.removeEventListener(WidgetEvent.CWE_COLOUR_ARRAY,this.onAvailableColours);
         events.removeEventListener(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,this.onAvailableMultiColours);
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_355 = _window.findChildByName("colourGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("color_chooser_cell") as XmlAsset;
         this.var_1714 = _loc1_.content as XML;
         events.addEventListener(WidgetEvent.CWE_COLOUR_ARRAY,this.onAvailableColours);
         events.addEventListener(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,this.onAvailableMultiColours);
         return true;
      }
      
      private function onAvailableColours(param1:CatalogWidgetColoursEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_912 = [];
         for each(_loc2_ in param1.colours)
         {
            this.var_912.push([_loc2_]);
         }
         _loc3_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         this.var_599 = _loc3_.content as BitmapData;
         _loc4_ = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         this.var_913 = _loc4_.content as BitmapData;
         _loc5_ = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         this.var_911 = _loc5_.content as BitmapData;
         this.populateColourGrid();
         this.select(this.var_355.getGridItemAt(0) as IWindowContainer);
      }
      
      private function onAvailableMultiColours(param1:CatalogWidgetMultiColoursEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_912 = [];
         for each(_loc2_ in param1.colours)
         {
            this.var_912.push(_loc2_.slice());
         }
         _loc3_ = page.viewer.catalog.assets.getAssetByName(param1.backgroundAssetName) as BitmapDataAsset;
         this.var_599 = _loc3_.content as BitmapData;
         _loc4_ = page.viewer.catalog.assets.getAssetByName(param1.colourAssetName) as BitmapDataAsset;
         this.var_913 = _loc4_.content as BitmapData;
         _loc5_ = page.viewer.catalog.assets.getAssetByName(param1.chosenColourAssetName) as BitmapDataAsset;
         this.var_911 = _loc5_.content as BitmapData;
         this.populateColourGrid();
         this.select(this.var_355.getGridItemAt(0) as IWindowContainer);
      }
      
      private function select(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         Logger.log("[ColourGridCatalogWidget] Select: " + param1);
         if(this.var_340 != null)
         {
            _loc2_ = this.var_340.getChildByName("chosen");
            if(_loc2_ != null)
            {
               _loc2_.visible = false;
            }
         }
         this.var_340 = param1;
         if(this.var_340 != null)
         {
            _loc2_ = this.var_340.getChildByName("chosen");
         }
         if(_loc2_ != null)
         {
            _loc2_.visible = true;
         }
      }
      
      private function populateColourGrid() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = 0;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:int = 0;
         Logger.log("[ColourGridCatalogWidget] Display colors: " + [this.var_912.length,this.var_355.numGridItems]);
         this.var_355.destroyGridItems();
         this.var_340 = null;
         for each(_loc1_ in this.var_912)
         {
            if(_loc1_.length > 0)
            {
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(this.var_1714) as IWindowContainer;
               _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onClick);
               _loc2_.background = true;
               _loc2_.color = 4294967295;
               _loc2_.width = this.var_599.width;
               _loc2_.height = this.var_599.height;
               this.var_355.addGridItem(_loc2_);
               _loc3_ = _loc2_.findChildByTag("BG_BORDER") as IBitmapWrapperWindow;
               if(_loc3_ != null)
               {
                  _loc3_.bitmap = new BitmapData(this.var_599.width,this.var_599.height,true,0);
                  _loc3_.bitmap.copyPixels(this.var_599,this.var_599.rect,new Point(0,0));
               }
               _loc4_ = _loc2_.findChildByTag("COLOR_IMAGE") as IBitmapWrapperWindow;
               if(_loc4_ != null)
               {
                  _loc4_.bitmap = new BitmapData(this.var_913.width,this.var_913.height,true,0);
                  _loc6_ = 255;
                  _loc7_ = 255;
                  _loc8_ = 255;
                  _loc9_ = null;
                  _loc10_ = null;
                  _loc11_ = _loc1_[0];
                  if(_loc11_ >= 0)
                  {
                     _loc6_ = uint(_loc11_ >> 16 & 255);
                     _loc7_ = uint(_loc11_ >> 8 & 255);
                     _loc8_ = uint(_loc11_ >> 0 & 255);
                  }
                  _loc9_ = this.var_913.clone();
                  _loc9_.colorTransform(_loc9_.rect,new ColorTransform(_loc6_ / 255,_loc7_ / 255,_loc8_ / 255));
                  if(_loc1_.length > 1)
                  {
                     _loc12_ = _loc1_[1];
                     if(_loc12_ >= 0)
                     {
                        _loc6_ = uint(_loc12_ >> 16 & 255);
                        _loc7_ = uint(_loc12_ >> 8 & 255);
                        _loc8_ = uint(_loc12_ >> 0 & 255);
                     }
                     _loc10_ = this.var_913.clone();
                     _loc10_.colorTransform(_loc10_.rect,new ColorTransform(_loc6_ / 255,_loc7_ / 255,_loc8_ / 255));
                  }
                  _loc4_.bitmap.copyPixels(_loc9_,_loc9_.rect,new Point(0,0));
                  _loc9_.dispose();
                  if(_loc10_ != null)
                  {
                     _loc13_ = _loc10_.width / 2;
                     _loc4_.bitmap.copyPixels(_loc10_,new Rectangle(_loc13_,0,_loc10_.width - _loc13_,_loc10_.height),new Point(_loc10_.width / 2,0));
                     _loc10_.dispose();
                  }
               }
               _loc5_ = _loc2_.findChildByTag("COLOR_CHOSEN") as IBitmapWrapperWindow;
               if(_loc5_ != null)
               {
                  _loc5_.bitmap = new BitmapData(this.var_911.width,this.var_911.height,true,16777215);
                  _loc5_.bitmap.copyPixels(this.var_911,this.var_911.rect,new Point(0,0),null,null,true);
                  _loc5_.visible = false;
               }
            }
         }
      }
      
      private function onClick(param1:WindowMouseEvent) : void
      {
         this.select(param1.target as IWindowContainer);
         var _loc2_:int = this.var_355.getGridItemIndex(param1.target as IWindow);
         events.dispatchEvent(new CatalogWidgetColourIndexEvent(_loc2_));
      }
   }
}
