package com.sulake.room.renderer
{
   import com.sulake.core.utils.Map;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.logic.IRoomObjectMouseHandler;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectSpriteVisualization;
   import com.sulake.room.renderer.cache.BitmapDataCache;
   import com.sulake.room.renderer.cache.RoomObjectCache;
   import com.sulake.room.renderer.cache.RoomObjectCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectLocationCacheItem;
   import com.sulake.room.renderer.cache.RoomObjectSortableSpriteCacheItem;
   import com.sulake.room.renderer.utils.ExtendedBitmapData;
   import com.sulake.room.renderer.utils.ExtendedSprite;
   import com.sulake.room.renderer.utils.ObjectMouseData;
   import com.sulake.room.renderer.utils.SortableSprite;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.RoomGeometry;
   import com.sulake.room.utils.Vector3d;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class RoomSpriteCanvas implements IRoomRenderingCanvas
   {
      
      private static const const_618:Point = new Point(0,0);
      
      private static const const_330:int = 50;
      
      private static const const_1324:int = 50;
      
      private static const const_1323:Number = 60;
      
      private static const const_1322:Number = 50;
      
      private static const const_1325:int = 300;
      
      private static const RENDER_TIME_COUNT:int = 50;
       
      
      private var _container:IRoomSpriteCanvasContainer;
      
      private var _geometry:RoomGeometry;
      
      private var var_2907:int = 0;
      
      private var var_262:Sprite;
      
      private var var_135:Sprite;
      
      private var var_97:Sprite;
      
      private var var_616:Map;
      
      private var var_502:Point;
      
      private var var_263:BitmapDataCache;
      
      private var var_613:RoomObjectCache;
      
      private var var_503:Array;
      
      private var var_612:Array;
      
      private var var_1406:IRoomRenderingCanvasMouseListener = null;
      
      private var _id:String = "";
      
      private var var_361:Map = null;
      
      private var var_1768:int = 0;
      
      private var var_740:int;
      
      private var var_739:int;
      
      private var var_614:int;
      
      private var var_615:int;
      
      private var var_2440:int;
      
      private var var_2438:int;
      
      private var var_1407:int = -1;
      
      private var var_2437:Number = -1.0E7;
      
      private var var_2439:Number = -1.0E7;
      
      private var var_1132:int = 0;
      
      private var var_1770:Boolean = false;
      
      private var var_959:Boolean = false;
      
      private var var_926:ColorTransform;
      
      private var var_924:Matrix;
      
      private var var_552:Number = 0.0;
      
      private var var_741:int = 0;
      
      private var var_1133:Boolean = false;
      
      private var var_1769:Boolean = false;
      
      private var var_925:int = 0;
      
      private var var_2864:Array;
      
      private var var_742:int = 0;
      
      public function RoomSpriteCanvas(param1:IRoomSpriteCanvasContainer, param2:String, param3:int, param4:int, param5:int)
      {
         this.var_616 = new Map();
         this.var_502 = new Point();
         this.var_503 = [];
         this.var_612 = [];
         this.var_2864 = [];
         super();
         this._container = param1;
         this._id = param2;
         this.var_262 = new Sprite();
         this.var_262.mouseEnabled = false;
         this.var_97 = new Sprite();
         this.var_97.name = "canvas";
         this.var_97.mouseEnabled = false;
         this.var_262.addChild(this.var_97);
         this.var_97.mouseEnabled = true;
         this.var_97.doubleClickEnabled = true;
         this.var_97.addEventListener(MouseEvent.CLICK,this.clickHandler);
         this.var_97.addEventListener(MouseEvent.DOUBLE_CLICK,this.clickHandler);
         this._geometry = new RoomGeometry(param5,new Vector3d(-135,30,0),new Vector3d(11,11,5),new Vector3d(-135,0.5,0));
         this.var_263 = new BitmapDataCache(1024 * 1024 * 16);
         var _loc6_:* = null;
         if(this._container != null)
         {
            _loc6_ = this._container.roomObjectVariableAccurateZ;
         }
         this.var_361 = new Map();
         this.var_613 = new RoomObjectCache(_loc6_);
         this.var_926 = new ColorTransform();
         this.var_924 = new Matrix();
         this.initialize(param3,param4);
      }
      
      public function get width() : int
      {
         return this.var_740;
      }
      
      public function get height() : int
      {
         return this.var_739;
      }
      
      public function set screenOffsetX(param1:int) : void
      {
         this.var_502.x -= param1 - this.var_614;
         this.var_614 = param1;
      }
      
      public function set screenOffsetY(param1:int) : void
      {
         this.var_502.y -= param1 - this.var_615;
         this.var_615 = param1;
      }
      
      public function get screenOffsetX() : int
      {
         return this.var_614;
      }
      
      public function get screenOffsetY() : int
      {
         return this.var_615;
      }
      
      public function get displayObject() : DisplayObject
      {
         return this.var_262;
      }
      
      public function get geometry() : IRoomGeometry
      {
         return this._geometry;
      }
      
      public function set mouseListener(param1:IRoomRenderingCanvasMouseListener) : void
      {
         this.var_1406 = param1;
      }
      
      public function set useMask(param1:Boolean) : void
      {
         if(param1 && !this.var_959)
         {
            this.var_959 = true;
            if(this.var_135 != null && !this.var_262.contains(this.var_135))
            {
               this.var_262.addChild(this.var_135);
               this.var_97.mask = this.var_135;
            }
         }
         else if(!param1 && this.var_959)
         {
            this.var_959 = false;
            if(this.var_135 != null && this.var_262.contains(this.var_135))
            {
               this.var_262.removeChild(this.var_135);
               this.var_97.mask = null;
            }
         }
      }
      
      public function dispose() : void
      {
         if(this._geometry != null)
         {
            this._geometry.dispose();
            this._geometry = null;
         }
         if(this.var_135 != null)
         {
            this.var_135 = null;
         }
         if(this.var_263 != null)
         {
            this.var_263.dispose();
            this.var_263 = null;
         }
         if(this.var_613 != null)
         {
            this.var_613.dispose();
            this.var_613 = null;
         }
         this._container = null;
         this.cleanSprites(0,true);
         if(this.var_262 != null)
         {
            while(this.var_262.numChildren > 0)
            {
               this.var_262.removeChildAt(0);
            }
            this.var_262 = null;
         }
         this.var_97 = null;
         this.var_135 = null;
         this.var_503 = [];
         if(this.var_616 != null)
         {
            this.var_616.dispose();
            this.var_616 = null;
         }
         var _loc1_:int = 0;
         if(this.var_612 != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this.var_612.length)
            {
               this.cleanSprite(this.var_612[_loc1_] as ExtendedSprite,true);
               _loc1_++;
            }
            this.var_612 = [];
         }
         if(this.var_361 != null)
         {
            this.var_361.dispose();
            this.var_361 = null;
         }
         this.var_1406 = null;
         this.var_926 = null;
         this.var_924 = null;
      }
      
      public function initialize(param1:int, param2:int) : void
      {
         if(param1 < 1)
         {
            param1 = 1;
         }
         if(param2 < 1)
         {
            param2 = 1;
         }
         if(this.var_135 != null)
         {
            this.var_135.graphics.clear();
         }
         else
         {
            this.var_135 = new Sprite();
            this.var_135.name = "mask";
            if(this.var_959)
            {
               this.var_262.addChild(this.var_135);
               this.var_97.mask = this.var_135;
            }
         }
         this.var_135.graphics.beginFill(0);
         this.var_135.graphics.drawRect(0,0,param1,param2);
         this.var_740 = param1;
         this.var_739 = param2;
      }
      
      public function roomObjectRemoved(param1:String) : void
      {
         this.var_613.removeObjectCache(param1);
      }
      
      public function render(param1:int) : void
      {
         this.var_1769 = !this.var_1769;
         if(this._container == null || this._geometry == null)
         {
            return;
         }
         if(param1 == this.var_1407)
         {
            return;
         }
         this.calculateUpdateInterval(param1);
         this.var_263.compress();
         var _loc3_:int = this._container.getRoomObjectCount();
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:String = "";
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         if(this.var_740 != this.var_2440 || this.var_739 != this.var_2438)
         {
            _loc8_ = true;
         }
         if(this.var_97.x != this.var_614 || this.var_97.y != this.var_615)
         {
            this.var_97.x = this.var_614;
            this.var_97.y = this.var_615;
            _loc8_ = true;
         }
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _loc7_ = this._container.getRoomObjectWithIndex(_loc4_);
            if(_loc7_ != null)
            {
               _loc6_ = this._container.getRoomObjectIdWithIndex(_loc4_);
               _loc5_ += this.renderObject(_loc7_,_loc6_,param1,_loc8_,_loc5_);
            }
            _loc4_++;
         }
         this.var_503.sortOn("z",0 | 0);
         if(_loc5_ < this.var_503.length)
         {
            this.var_503.splice(_loc5_);
         }
         var _loc9_:* = null;
         _loc4_ = 0;
         while(_loc4_ < _loc5_)
         {
            _loc9_ = this.var_503[_loc4_] as SortableSprite;
            if(_loc9_ != null)
            {
               this.updateSprite(_loc4_,_loc9_);
            }
            _loc4_++;
         }
         this.cleanSprites(_loc5_);
         this.var_1407 = param1;
         this.var_2440 = this.var_740;
         this.var_2438 = this.var_739;
      }
      
      private function calculateUpdateInterval(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         if(this.var_1407 > 0)
         {
            _loc2_ = param1 - this.var_1407;
            if(_loc2_ <= const_1325)
            {
               ++this.var_741;
               if(this.var_741 == const_330 + 1)
               {
                  this.var_552 = _loc2_;
               }
               else if(this.var_741 > const_330 + 1)
               {
                  _loc3_ = Number(this.var_741 - const_330);
                  this.var_552 = this.var_552 * (_loc3_ - 1) / _loc3_ + Number(_loc2_) / _loc3_;
                  if(this.var_741 > const_330 + const_1324)
                  {
                     if(!this.var_1133 && this.var_552 > const_1323)
                     {
                        this.var_1133 = true;
                        Logger.log("Room canvas updating really slow - now entering frame skipping mode...");
                     }
                     else if(this.var_1133 && this.var_552 < const_1322)
                     {
                        this.var_1133 = false;
                        Logger.log("Room canvas updating fast again - now entering normal frame mode...");
                     }
                     this.var_741 = const_330;
                  }
               }
            }
         }
      }
      
      private function renderObject(param1:IRoomObject, param2:String, param3:int, param4:Boolean, param5:int) : int
      {
         var _loc22_:* = null;
         var _loc6_:IRoomObjectSpriteVisualization = param1.getVisualization() as IRoomObjectSpriteVisualization;
         if(_loc6_ == null)
         {
            this.var_613.removeObjectCache(param2);
            return 0;
         }
         var _loc7_:RoomObjectCacheItem = this.var_613.getObjectCache(param2);
         var _loc8_:RoomObjectLocationCacheItem = _loc7_.location;
         var _loc9_:RoomObjectSortableSpriteCacheItem = _loc7_.sprites;
         var _loc10_:IVector3d = _loc8_.getScreenLocation(param1,this._geometry);
         if(_loc10_ == null)
         {
            this.var_613.removeObjectCache(param2);
            return 0;
         }
         _loc6_.update(this._geometry,param3,!_loc9_.isEmpty || param4,this.var_1769 && this.var_1133);
         var _loc11_:Boolean = _loc8_.locationChanged;
         if(_loc11_)
         {
            param4 = true;
         }
         if(!_loc9_.needsUpdate(_loc6_.getInstanceId(),_loc6_.getUpdateID()) && !param4)
         {
            return _loc9_.spriteCount;
         }
         var _loc12_:int = _loc6_.spriteCount;
         var _loc13_:int = _loc10_.x;
         var _loc14_:int = _loc10_.y;
         var _loc15_:Number = _loc10_.z;
         if(_loc13_ > 0)
         {
            _loc15_ += _loc13_ * 1.2e-7;
         }
         else
         {
            _loc15_ += -_loc13_ * 1.2e-7;
         }
         _loc13_ += int(this.var_740 / 2);
         _loc14_ += int(this.var_739 / 2);
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         while(_loc21_ < _loc12_)
         {
            _loc18_ = _loc6_.getSprite(_loc21_);
            if(_loc18_ != null && _loc18_.visible)
            {
               _loc22_ = _loc18_.asset;
               if(_loc22_ != null)
               {
                  _loc19_ = _loc13_ + _loc18_.offsetX + this.var_614;
                  _loc20_ = _loc14_ + _loc18_.offsetY + this.var_615;
                  if(_loc19_ < this.var_740 && _loc19_ + _loc22_.width >= 0 && (_loc20_ < this.var_739 && _loc20_ + _loc22_.height >= 0))
                  {
                     _loc17_ = _loc9_.getSprite(_loc16_);
                     if(_loc17_ == null)
                     {
                        _loc17_ = new SortableSprite();
                        _loc9_.addSprite(_loc17_);
                        this.var_503.push(_loc17_);
                        _loc17_.name = param2;
                     }
                     _loc17_.sprite = _loc18_;
                     _loc17_.x = _loc19_ - this.var_614;
                     _loc17_.y = _loc20_ - this.var_615;
                     _loc17_.z = _loc15_ + _loc18_.relativeDepth + 3.7e-11 * param5;
                     _loc16_++;
                     param5++;
                  }
               }
            }
            _loc21_++;
         }
         _loc9_.setSpriteCount(_loc16_);
         return _loc16_;
      }
      
      private function getSprite(param1:int) : ExtendedSprite
      {
         if(param1 < 0 || param1 >= this.var_925)
         {
            return null;
         }
         return this.var_97.getChildAt(param1) as ExtendedSprite;
      }
      
      private function createSprite(param1:SortableSprite, param2:int = -1) : void
      {
         var _loc3_:* = null;
         var _loc4_:IRoomObjectSprite = param1.sprite;
         if(this.var_612.length > 0)
         {
            _loc3_ = this.var_612.pop() as ExtendedSprite;
         }
         if(_loc3_ == null)
         {
            _loc3_ = new ExtendedSprite();
         }
         _loc3_.x = param1.x;
         _loc3_.y = param1.y;
         _loc3_.identifier = param1.name;
         _loc3_.alpha = _loc4_.alpha / 255;
         _loc3_.tag = _loc4_.tag;
         _loc3_.blendMode = _loc4_.blendMode;
         _loc3_.filters = _loc4_.filters;
         _loc3_.varyingDepth = _loc4_.varyingDepth;
         _loc3_.clickHandling = _loc4_.clickHandling;
         _loc3_.smoothing = false;
         _loc3_.pixelSnapping = PixelSnapping.ALWAYS;
         _loc3_.bitmapData = this.getBitmapData(_loc4_.asset,_loc4_.assetName,_loc4_.flipH,_loc4_.color);
         if(_loc4_.capturesMouse)
         {
            _loc3_.alphaTolerance = 128;
         }
         else
         {
            _loc3_.alphaTolerance = 256;
         }
         if(param2 < 0 || param2 >= this.var_925)
         {
            this.var_97.addChild(_loc3_);
            ++this.var_925;
         }
         else
         {
            this.var_97.addChildAt(_loc3_,param2);
         }
         ++this.var_742;
      }
      
      private function updateSprite(param1:int, param2:SortableSprite) : Boolean
      {
         var _loc5_:Number = NaN;
         var _loc6_:* = null;
         if(param1 >= this.var_925)
         {
            this.createSprite(param2);
            return true;
         }
         var _loc3_:IRoomObjectSprite = param2.sprite;
         var _loc4_:ExtendedSprite = this.getSprite(param1);
         if(_loc4_ != null)
         {
            if(_loc4_.varyingDepth != _loc3_.varyingDepth)
            {
               if(_loc4_.varyingDepth && !_loc3_.varyingDepth)
               {
                  this.var_97.removeChildAt(param1);
                  this.var_612.push(_loc4_);
                  return this.updateSprite(param1,param2);
               }
               this.createSprite(param2,param1);
               return true;
            }
            if(_loc4_.needsUpdate(_loc3_.instanceId,_loc3_.updateId))
            {
               if(_loc3_.capturesMouse)
               {
                  _loc4_.alphaTolerance = 128;
               }
               else
               {
                  _loc4_.alphaTolerance = 256;
               }
               _loc5_ = _loc3_.alpha / 255;
               if(_loc4_.alpha != _loc5_)
               {
                  _loc4_.alpha = _loc5_;
               }
               _loc4_.identifier = param2.name;
               _loc4_.tag = _loc3_.tag;
               _loc4_.varyingDepth = _loc3_.varyingDepth;
               _loc4_.blendMode = _loc3_.blendMode;
               _loc4_.clickHandling = _loc3_.clickHandling;
               _loc4_.filters = _loc3_.filters;
               _loc6_ = this.getBitmapData(_loc3_.asset,_loc3_.assetName,_loc3_.flipH,_loc3_.color);
               if(_loc4_.bitmapData != _loc6_)
               {
                  _loc4_.bitmapData = _loc6_;
               }
            }
            if(_loc4_.x != param2.x)
            {
               _loc4_.x = param2.x;
            }
            if(_loc4_.y != param2.y)
            {
               _loc4_.y = param2.y;
            }
            return true;
         }
         return false;
      }
      
      private function cleanSprites(param1:int, param2:Boolean = false) : void
      {
         var _loc4_:int = 0;
         if(this.var_97 == null)
         {
            return;
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         var _loc3_:* = null;
         if(param1 < this.var_742 || this.var_742 == 0)
         {
            _loc4_ = this.var_925 - 1;
            while(_loc4_ >= param1)
            {
               _loc3_ = this.getSprite(_loc4_);
               this.cleanSprite(_loc3_,param2);
               _loc4_--;
            }
         }
         this.var_742 = param1;
      }
      
      private function cleanSprite(param1:ExtendedSprite, param2:Boolean) : void
      {
         if(param1 != null)
         {
            if(!param2)
            {
               param1.bitmapData = null;
            }
            else
            {
               param1.dispose();
            }
         }
      }
      
      private function getSortableSprite(param1:int) : SortableSprite
      {
         if(param1 < 0 || param1 >= this.var_503.length)
         {
            return null;
         }
         return this.var_503[param1] as SortableSprite;
      }
      
      private function getBitmapData(param1:BitmapData, param2:String, param3:Boolean, param4:int) : BitmapData
      {
         param4 &= 16777215;
         if(!param3 && param4 == 16777215)
         {
            return param1;
         }
         var _loc5_:* = null;
         var _loc6_:* = "";
         if(param3 && param4 != 16777215)
         {
            _loc6_ = param2 + " " + param4 + " FH";
            if(param2.length > 0)
            {
               _loc5_ = this.var_263.getBitmapData(_loc6_);
            }
            if(_loc5_ == null)
            {
               _loc5_ = this.getColoredBitmapData(param1,param2,param4);
               if(_loc5_ != null)
               {
                  _loc5_ = this.getFlippedBitmapData(_loc5_,"",true);
                  if(param2.length > 0)
                  {
                     this.var_263.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = this.getFlippedBitmapData(_loc5_,param2);
               if(_loc5_ != null)
               {
                  _loc5_ = this.getColoredBitmapData(_loc5_,"",param4,true);
                  if(param2.length > 0)
                  {
                     this.var_263.addBitmapData(_loc6_,_loc5_);
                  }
                  return _loc5_;
               }
               _loc5_ = this.getColoredBitmapData(param1,param2,param4,true);
               _loc5_ = this.getFlippedBitmapData(_loc5_,"",true);
               if(param2.length > 0)
               {
                  this.var_263.addBitmapData(_loc6_,_loc5_);
               }
            }
         }
         else if(param3)
         {
            _loc5_ = this.getFlippedBitmapData(param1,param2,true);
         }
         else
         {
            if(param4 == 16777215)
            {
               return param1;
            }
            _loc5_ = this.getColoredBitmapData(param1,param2,param4,true);
         }
         return _loc5_;
      }
      
      private function getFlippedBitmapData(param1:BitmapData, param2:String, param3:Boolean = false) : ExtendedBitmapData
      {
         var data:BitmapData = param1;
         var name:String = param2;
         var allowCreation:Boolean = param3;
         var cacheName:String = name + " FH";
         var finalData:ExtendedBitmapData = null;
         if(name.length > 0)
         {
            finalData = this.var_263.getBitmapData(cacheName);
            if(!allowCreation)
            {
               return finalData;
            }
         }
         if(finalData == null)
         {
            try
            {
               finalData = new ExtendedBitmapData(data.width,data.height,true,16777215);
            }
            catch(e:Error)
            {
               finalData = new ExtendedBitmapData(1,1,true,16777215);
            }
            this.var_924.identity();
            this.var_924.scale(-1,1);
            this.var_924.translate(data.width,0);
            finalData.draw(data,this.var_924);
            if(name.length > 0)
            {
               this.var_263.addBitmapData(cacheName,finalData);
            }
         }
         return finalData;
      }
      
      private function getColoredBitmapData(param1:BitmapData, param2:String, param3:int, param4:Boolean = false) : ExtendedBitmapData
      {
         var r:int = 0;
         var g:int = 0;
         var b:int = 0;
         var tR:Number = NaN;
         var tG:Number = NaN;
         var tB:Number = NaN;
         var data:BitmapData = param1;
         var name:String = param2;
         var color:int = param3;
         var allowCreation:Boolean = param4;
         var cacheName:String = name + " " + color;
         var finalData:ExtendedBitmapData = null;
         if(name.length > 0)
         {
            finalData = this.var_263.getBitmapData(cacheName);
            if(!allowCreation)
            {
               return finalData;
            }
         }
         if(finalData == null)
         {
            r = color >> 16 & 255;
            g = color >> 8 & 255;
            b = color & 255;
            tR = r / 255;
            tG = g / 255;
            tB = b / 255;
            try
            {
               finalData = new ExtendedBitmapData(data.width,data.height,true,16777215);
               finalData.copyPixels(data,data.rect,const_618);
            }
            catch(e:Error)
            {
               finalData = new ExtendedBitmapData(1,1,true,16777215);
            }
            this.var_926.redMultiplier = tR;
            this.var_926.greenMultiplier = tG;
            this.var_926.blueMultiplier = tB;
            finalData.colorTransform(finalData.rect,this.var_926);
            if(name.length > 0)
            {
               this.var_263.addBitmapData(cacheName,finalData);
            }
         }
         return finalData;
      }
      
      private function getObjectId(param1:ExtendedSprite) : String
      {
         var _loc2_:* = null;
         if(param1 != null)
         {
            return param1.identifier;
         }
         return "";
      }
      
      public function handleMouseEvent(param1:int, param2:int, param3:String, param4:Boolean, param5:Boolean, param6:Boolean, param7:Boolean) : Boolean
      {
         param1 -= this.var_614;
         param2 -= this.var_615;
         this.var_502.x = param1;
         this.var_502.y = param2;
         if(this.var_1132 > 0 && param3 == MouseEvent.MOUSE_MOVE)
         {
            return this.var_1770;
         }
         this.var_1770 = this.checkMouseHits(param1,param2,param3,param4,param5,param6,param7);
         ++this.var_1132;
         return this.var_1770;
      }
      
      private function createMouseEvent(param1:int, param2:int, param3:int, param4:int, param5:String, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean) : RoomSpriteMouseEvent
      {
         var _loc11_:Number = param1 - this.var_740 / 2;
         var _loc12_:Number = param2 - this.var_739 / 2;
         var _loc13_:* = null;
         return new RoomSpriteMouseEvent(param5,this._id + "_" + this.var_1768,this._id,param6,_loc11_,_loc12_,param3,param4,param8,param7,param9,param10);
      }
      
      private function checkMouseClickHits(param1:Number, param2:Number, param3:Boolean, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc15_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:String = "null";
         if(param3)
         {
            _loc12_ = "null";
         }
         var _loc13_:* = [];
         var _loc14_:int = 0;
         _loc14_ = this.var_742 - 1;
         while(_loc14_ >= 0)
         {
            _loc10_ = this.getSprite(_loc14_);
            if(_loc10_ != null && _loc10_.clickHandling)
            {
               if(_loc10_.hitTest(param1 - _loc10_.x,param2 - _loc10_.y))
               {
                  _loc9_ = this.getObjectId(_loc10_);
                  if(_loc13_.indexOf(_loc9_) < 0)
                  {
                     _loc15_ = _loc10_.tag;
                     _loc11_ = this.createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,_loc12_,_loc15_,param4,param5,param6,param7);
                     this.bufferMouseEvent(_loc11_,_loc9_);
                     _loc13_.push(_loc9_);
                  }
               }
               _loc8_ = true;
            }
            _loc14_--;
         }
         this.processMouseEvents();
         return _loc8_;
      }
      
      private function checkMouseHits(param1:int, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false) : Boolean
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:String = "";
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = [];
         var _loc13_:* = null;
         var _loc14_:int = 0;
         _loc14_ = this.var_742 - 1;
         while(_loc14_ >= 0)
         {
            _loc10_ = this.getSprite(_loc14_) as ExtendedSprite;
            if(_loc10_ != null && _loc10_.hitTestPoint(param1 - _loc10_.x,param2 - _loc10_.y))
            {
               if(!_loc10_.clickHandling || param3 != MouseEvent.CLICK && param3 != MouseEvent.DOUBLE_CLICK)
               {
                  _loc9_ = this.getObjectId(_loc10_);
                  if(_loc12_.indexOf(_loc9_) < 0)
                  {
                     _loc16_ = _loc10_.tag;
                     _loc13_ = this.var_616.getValue(_loc9_) as ObjectMouseData;
                     if(_loc13_ != null)
                     {
                        if(_loc13_.spriteTag != _loc16_)
                        {
                           _loc11_ = this.createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                           this.bufferMouseEvent(_loc11_,_loc9_);
                        }
                     }
                     if(param3 == MouseEvent.MOUSE_MOVE && (_loc13_ == null || _loc13_.spriteTag != _loc16_))
                     {
                        _loc11_ = this.createMouseEvent(param1,param2,param1 - _loc10_.x,param2 - _loc10_.y,MouseEvent.ROLL_OVER,_loc16_,param4,param5,param6,param7);
                     }
                     else
                     {
                        _loc11_ = this.createMouseEvent(param1,param2,param1 - _loc10_.y,param2 - _loc10_.y,param3,_loc16_,param4,param5,param6,param7);
                     }
                     if(_loc13_ == null)
                     {
                        _loc13_ = new ObjectMouseData();
                        _loc13_.objectId = _loc9_;
                        this.var_616.add(_loc9_,_loc13_);
                     }
                     _loc13_.spriteTag = _loc16_;
                     if(param3 != MouseEvent.MOUSE_MOVE || param1 != this.var_2437 || param2 != this.var_2439)
                     {
                        this.bufferMouseEvent(_loc11_,_loc9_);
                     }
                     _loc12_.push(_loc9_);
                  }
                  _loc8_ = true;
               }
            }
            _loc14_--;
         }
         var _loc15_:Array = this.var_616.getKeys();
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc17_ = _loc15_[_loc14_] as String;
            _loc18_ = _loc12_.indexOf(_loc17_);
            if(_loc18_ >= 0)
            {
               _loc15_[_loc14_] = null;
            }
            _loc14_++;
         }
         _loc14_ = 0;
         while(_loc14_ < _loc15_.length)
         {
            _loc9_ = _loc15_[_loc14_] as String;
            if(_loc9_ != null)
            {
               _loc13_ = this.var_616.remove(_loc9_) as ObjectMouseData;
               if(_loc13_ != null)
               {
                  _loc11_ = this.createMouseEvent(0,0,0,0,MouseEvent.ROLL_OUT,_loc13_.spriteTag,param4,param5,param6,param7);
                  this.bufferMouseEvent(_loc11_,_loc9_);
               }
            }
            _loc14_++;
         }
         this.processMouseEvents();
         this.var_2437 = param1;
         this.var_2439 = param2;
         return _loc8_;
      }
      
      private function bufferMouseEvent(param1:RoomSpriteMouseEvent, param2:String) : void
      {
         if(this.var_361 != null && param1 != null)
         {
            this.var_361.add(param2,param1);
         }
      }
      
      private function processMouseEvents() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this._container == null || this.var_361 == null)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this.var_361.length)
         {
            _loc2_ = this.var_361.getKey(_loc1_);
            _loc3_ = this.var_361.getWithIndex(_loc1_);
            if(_loc2_ != null && _loc3_ != null)
            {
               _loc4_ = this._container.getRoomObject(_loc2_);
               if(_loc4_ != null)
               {
                  if(this.var_1406 != null)
                  {
                     this.var_1406.processRoomCanvasMouseEvent(_loc3_,_loc4_,this.geometry);
                  }
                  else
                  {
                     _loc5_ = _loc4_.getMouseHandler();
                     if(_loc5_ != null)
                     {
                        _loc5_.mouseEvent(_loc3_,this._geometry);
                     }
                  }
               }
            }
            _loc1_++;
         }
         this.var_361.reset();
      }
      
      public function update() : void
      {
         if(this.var_1132 == 0)
         {
            this.checkMouseHits(this.var_502.x,this.var_502.y,MouseEvent.MOUSE_MOVE);
         }
         this.var_1132 = 0;
         ++this.var_1768;
      }
      
      private function clickHandler(param1:MouseEvent) : void
      {
         var _loc2_:* = false;
         if(param1.type == MouseEvent.CLICK || param1.type == MouseEvent.DOUBLE_CLICK)
         {
            _loc2_ = param1.type == MouseEvent.DOUBLE_CLICK;
            this.checkMouseClickHits(param1.localX,param1.localY,_loc2_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
         }
      }
   }
}
