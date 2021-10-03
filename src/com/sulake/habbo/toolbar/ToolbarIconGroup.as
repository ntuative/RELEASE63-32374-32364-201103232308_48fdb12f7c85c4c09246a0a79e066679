package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public class ToolbarIconGroup
   {
       
      
      private var var_325:Array;
      
      private var var_815:Array;
      
      private var var_1514:Array;
      
      private var var_1513:Array;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_40:IWindowContainer;
      
      private var _events:IEventDispatcher;
      
      private var var_609:ToolbarBarMenuAnimator;
      
      private var var_469:Number;
      
      private var var_483:String;
      
      private var var_2717:Number;
      
      private var var_1515:Number;
      
      private var var_2422:int = 5;
      
      private var var_2716:int;
      
      private var var_153:Number;
      
      private var var_2718:XML;
      
      private var _connection:IConnection;
      
      public function ToolbarIconGroup(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IConnection, param4:int, param5:IEventDispatcher, param6:IWindowContainer, param7:ToolbarBarMenuAnimator, param8:Number)
      {
         this.var_325 = new Array();
         this.var_815 = new Array();
         this.var_1514 = new Array();
         this.var_1513 = new Array();
         super();
         this._windowManager = param1;
         this._assetLibrary = param2;
         this._connection = param3;
         this.var_40 = param6;
         this._events = param5;
         this.var_609 = param7;
         this.var_153 = param8;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(this.var_325.length > 0)
         {
            this.var_815.shift();
            _loc1_ = this.var_325.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
      }
      
      public function acceptsIcon(param1:String) : Boolean
      {
         return this.var_1513.indexOf(param1) > -1;
      }
      
      public function addContentIndexFromXmlList(param1:XML) : Boolean
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(param1 == null)
         {
            return false;
         }
         this.var_2718 = param1;
         _loc4_ = param1.elements("icon");
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_.length())
         {
            _loc8_ = _loc4_[_loc7_];
            _loc2_ = "null";
            if(_loc2_ != null)
            {
               if(!this.containsIcon(_loc2_))
               {
                  _loc6_ = this.createIconObject(_loc2_);
                  if(_loc6_ == null)
                  {
                     return false;
                  }
                  _loc6_.defineFromXML(_loc8_);
                  this.var_1514.push(_loc2_);
                  _loc5_ = _loc8_.elements("dock");
                  if(_loc5_.length() > 0)
                  {
                     _loc9_ = 0;
                     while(_loc9_ < _loc5_.length())
                     {
                        _loc3_ = "null";
                        this.var_1513.push(_loc3_);
                        _loc6_.dockMenu(_loc3_,this.getMenuYieldList(_loc3_),_loc5_[_loc9_].@locktoicon == "ParkBusCannotEnterMessageEvent");
                        _loc9_++;
                     }
                  }
                  else
                  {
                     this.var_1513.push(_loc2_);
                     if(_loc8_.elements("nodock").length() == 0)
                     {
                        _loc6_.dockMenu(_loc2_);
                     }
                  }
               }
            }
            _loc7_++;
         }
         return true;
      }
      
      public function getMenuYieldList(param1:String) : Array
      {
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc2_:Array = new Array();
         var _loc3_:XMLList = this.var_2718.elements("menu");
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_.length())
         {
            if(HabboToolbarIconEnum[_loc3_[_loc5_].@id] == param1)
            {
               _loc4_ = _loc3_[_loc5_].elements("yield");
               _loc6_ = 0;
               while(_loc6_ < _loc4_.length())
               {
                  _loc2_.push(HabboToolbarIconEnum[_loc4_[_loc6_].@id]);
                  _loc6_++;
               }
            }
            _loc5_++;
         }
         return _loc2_;
      }
      
      public function setIcon(param1:String, param2:Boolean) : void
      {
         var _loc3_:* = null;
         _loc3_ = this.getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIcon(param2);
            this.alignItems();
         }
      }
      
      public function setContent(param1:String, param2:BitmapData) : void
      {
         var _loc3_:* = null;
         _loc3_ = this.getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIconBitmapData(param2);
            this.alignItems();
         }
      }
      
      public function removeContent(param1:String) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = this.var_815.indexOf(param1);
         if(_loc2_ > -1)
         {
            _loc3_ = this.getIconById(param1);
            if(_loc3_ != null)
            {
               _loc3_.setIcon(false);
            }
         }
      }
      
      public function containsIcon(param1:String) : Boolean
      {
         return this.var_815.indexOf(param1) > -1;
      }
      
      public function get size() : Number
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_325.length)
         {
            if(this.var_325[_loc2_].exists)
            {
               _loc1_ += this.var_1515;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function get iconCount() : int
      {
         var _loc1_:* = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this.var_325.length)
         {
            if(this.var_325[_loc2_].exists)
            {
               _loc1_++;
            }
            _loc2_++;
         }
         return _loc1_;
      }
      
      public function set defaultIconSize(param1:Number) : void
      {
         this.var_2717 = param1;
      }
      
      public function get defaultIconSize() : Number
      {
         return this.var_2717;
      }
      
      public function set iconSize(param1:Number) : void
      {
         this.var_1515 = param1;
      }
      
      public function get iconSize() : Number
      {
         return this.var_1515;
      }
      
      public function get toolbarUsableWidth() : Number
      {
         return this.var_153;
      }
      
      public function set windowMargin(param1:int) : void
      {
         this.var_2422 = param1;
      }
      
      public function get windowMargin() : int
      {
         return this.var_2422;
      }
      
      public function set windowBottomMargin(param1:int) : void
      {
         this.var_2716 = param1;
      }
      
      public function get windowBottomMargin() : int
      {
         return this.var_2716;
      }
      
      public function set position(param1:Number) : void
      {
         this.var_469 = param1;
         this.alignItems();
      }
      
      public function set orientation(param1:String) : void
      {
         this.var_483 = param1;
      }
      
      public function get orientation() : String
      {
         return this.var_483;
      }
      
      private function alignItems() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = 0;
         var _loc4_:int = 0;
         while(_loc4_ < this.var_1514.length)
         {
            _loc2_ = this.var_815.indexOf(this.var_1514[_loc4_]);
            if(_loc2_ > -1)
            {
               _loc1_ = this.var_325[_loc2_];
               if(_loc1_.exists)
               {
                  _loc1_.changePosition(this.var_469 + _loc3_);
                  _loc3_ += this.var_1515;
               }
            }
            _loc4_++;
         }
      }
      
      public function getIconById(param1:String) : ToolbarIcon
      {
         if(!this.containsIcon(param1))
         {
            return null;
         }
         return this.var_325[this.var_815.indexOf(param1)];
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.var_325.length)
         {
            _loc2_ = this.var_325[_loc3_];
            if(_loc2_ != null)
            {
               if(_loc2_.docksMenu(param1))
               {
                  return _loc2_;
               }
            }
            _loc3_++;
         }
         return null;
      }
      
      private function createIconObject(param1:String) : ToolbarIcon
      {
         var _loc2_:* = null;
         _loc2_ = this.getIconById(param1);
         if(_loc2_ != null)
         {
            return _loc2_;
         }
         _loc2_ = new ToolbarIcon(this,this._windowManager,this._assetLibrary,this._connection,param1,this._events,this.var_609);
         this.var_40.addChild(_loc2_.window);
         this.var_815.push(param1);
         this.var_325.push(_loc2_);
         return _loc2_;
      }
   }
}
