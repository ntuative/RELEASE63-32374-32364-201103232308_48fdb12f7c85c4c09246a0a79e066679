package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      public static const const_1170:int = 1;
      
      public static const const_433:int = 2;
      
      private static const const_931:int = 5;
      
      private static const const_1265:int = 250;
      
      private static const const_1268:int = 100;
      
      private static const const_1267:int = 180;
      
      private static const const_1266:int = 200;
       
      
      private var var_338:Timer;
      
      private var var_339:Timer;
      
      private var _assets:IAssetLibrary;
      
      private var var_81:IWindowContainer;
      
      private var _parent:IWindowContainer;
      
      private var var_1586:int = 2;
      
      private var var_698:BitmapData;
      
      private var var_861:BitmapData;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         this.var_338 = new Timer(const_1265,1);
         this.var_339 = new Timer(const_1268,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         this.var_81 = param1;
         this.var_81.visible = false;
         this._assets = param2;
         this.var_338.addEventListener(TimerEvent.TIMER,this.onDisplayTimer);
         this.var_339.addEventListener(TimerEvent.TIMER,this.onHideTimer);
         var _loc3_:BitmapDataAsset = this._assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_861 = _loc3_.content as BitmapData;
         }
         _loc3_ = this._assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            this.var_698 = _loc3_.content as BitmapData;
         }
      }
      
      public function dispose() : void
      {
         if(this.var_338 != null)
         {
            this.var_338.removeEventListener(TimerEvent.TIMER,this.onDisplayTimer);
            this.var_338.stop();
            this.var_338 = null;
         }
         if(this.var_339 != null)
         {
            this.var_339.removeEventListener(TimerEvent.TIMER,this.onHideTimer);
            this.var_339.stop();
            this.var_339 = null;
         }
         this._assets = null;
         this.var_81 = null;
         this._parent = null;
         this.var_698 = null;
         this.var_861 = null;
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(this.var_81 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_81);
         }
         this._parent = param1;
         this.var_1586 = param4;
         var _loc5_:ITextWindow = ITextWindow(this.var_81.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = this.var_81.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1267,param3.width),Math.min(const_1266,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (this.var_81.width - _loc6_.width) / 2;
            this.var_81.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      public function show() : void
      {
         this.var_339.reset();
         this.var_338.reset();
         if(this._parent == null)
         {
            return;
         }
         this.var_81.visible = true;
         this._parent.addChild(this.var_81);
         this.refreshArrow(this.var_1586);
         switch(this.var_1586)
         {
            case const_1170:
               this.var_81.x = -1 * this.var_81.width - const_931;
               break;
            case const_433:
               this.var_81.x = this._parent.width + const_931;
         }
         this.var_81.y = (this._parent.height - this.var_81.height) / 2;
      }
      
      public function hide() : void
      {
         this.var_81.visible = false;
         this.var_339.reset();
         this.var_338.reset();
         if(this._parent != null)
         {
            this._parent.removeChild(this.var_81);
         }
      }
      
      public function showDelayed() : void
      {
         this.var_339.reset();
         this.var_338.reset();
         this.var_338.start();
      }
      
      public function hideDelayed() : void
      {
         this.var_339.reset();
         this.var_338.reset();
         this.var_339.start();
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(this.var_81 == null || this.var_81.disposed)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_81.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_1170:
               _loc2_.bitmap = this.var_861.clone();
               _loc2_.width = this.var_861.width;
               _loc2_.height = this.var_861.height;
               _loc2_.y = (this.var_81.height - this.var_861.height) / 2;
               _loc2_.x = this.var_81.width - 1;
               break;
            case const_433:
               _loc2_.bitmap = this.var_698.clone();
               _loc2_.width = this.var_698.width;
               _loc2_.height = this.var_698.height;
               _loc2_.y = (this.var_81.height - this.var_698.height) / 2;
               _loc2_.x = -1 * this.var_698.width + 1;
         }
         _loc2_.invalidate();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         this.show();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         this.hide();
      }
   }
}
