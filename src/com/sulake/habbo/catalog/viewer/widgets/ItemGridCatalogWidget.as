package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IDragAndDropDoneReceiver;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.CatalogWidgetInitPurchaseEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements ICatalogWidget, IItemGrid, IDragAndDropDoneReceiver
   {
       
      
      protected var var_1051:IItemGridWindow;
      
      protected var var_1807:XML;
      
      protected var var_340:IGridItem;
      
      private var var_1926:int = 0;
      
      private var var_199:Timer;
      
      protected var var_203:Boolean = true;
      
      private var var_1005:int = 0;
      
      private var _scrollBar:IScrollbarWindow;
      
      public function ItemGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         this._scrollBar = _window.findChildByName("itemGridScrollbar") as IScrollbarWindow;
         if(this._scrollBar != null)
         {
            this._scrollBar.visible = false;
            this._scrollBar.addEventListener(WindowEvent.const_696,this.activateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_296,this.activateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_715,this.deActivateScrollbar);
            this._scrollBar.addEventListener(WindowEvent.const_258,this.deActivateScrollbar);
         }
      }
      
      override public function dispose() : void
      {
         if(this.var_199 != null)
         {
            this.var_199.stop();
            this.var_199.removeEventListener(TimerEvent.TIMER,this.populateItemGrid);
            this.var_199 = null;
         }
         if(this.var_1051 != null)
         {
            this.var_1051.destroyGridItems();
            this.var_1051 = null;
         }
         this.var_1807 = null;
         this.var_340 = null;
         super.dispose();
      }
      
      override public function init() : Boolean
      {
         if(!super.init())
         {
            return false;
         }
         this.var_1051 = _window.findChildByName("itemGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         this.var_1807 = _loc1_.content as XML;
         this.populateItemGrid();
         this.loadItemGridGraphics();
         if(this.var_203)
         {
            this.var_199 = new Timer(25);
            this.var_199.addEventListener(TimerEvent.TIMER,this.loadItemGridGraphics);
            this.var_199.start();
         }
         return true;
      }
      
      public function select(param1:IGridItem) : void
      {
         if(this.var_340 != null)
         {
            this.var_340.deActivate();
         }
         this.var_340 = param1;
         param1.activate();
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
      }
      
      public function startDragAndDrop(param1:IGridItem) : Boolean
      {
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            (page.viewer.catalog as HabboCatalog).requestSelectedItemToMover(this,_loc2_);
         }
         return true;
      }
      
      public function onDragAndDropDone(param1:Boolean) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1)
         {
            events.dispatchEvent(new CatalogWidgetInitPurchaseEvent(false));
         }
      }
      
      public function stopDragAndDrop() : void
      {
      }
      
      protected function populateItemGrid() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in page.offers)
         {
            this.createGridItem(_loc1_);
            _loc1_.productContainer.grid = this;
         }
      }
      
      protected function loadItemGridGraphics(param1:TimerEvent = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc2_ = param1.currentTarget.currentCount;
            if(this.var_1005 == page.offers.length)
            {
               (param1.target as Timer).removeEventListener(TimerEvent.TIMER,this.populateItemGrid);
               (param1.target as Timer).stop();
            }
         }
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(this.var_1005 >= 0 && this.var_1005 < page.offers.length)
            {
               _loc4_ = page.offers[this.var_1005];
               this.loadGraphics(_loc4_);
               _loc4_.productContainer.grid = this;
            }
            ++this.var_1005;
            _loc3_++;
         }
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      protected function createGridItem(param1:Offer) : void
      {
         var _loc2_:IWindowContainer = page.viewer.catalog.windowManager.buildFromXML(this.var_1807) as IWindowContainer;
         this.var_1051.addGridItem(_loc2_);
         param1.productContainer.view = _loc2_;
         if(param1.pricingModel == Offer.const_509)
         {
            ++this.var_1926;
            (param1.productContainer as BundleProductContainer).setBundleCounter(this.var_1926);
         }
      }
      
      protected function loadGraphics(param1:Offer) : void
      {
         param1.productContainer.initProductIcon(page.viewer.roomEngine);
      }
   }
}
