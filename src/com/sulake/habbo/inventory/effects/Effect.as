package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _type:int;
      
      private var var_1608:int;
      
      private var var_876:int = 1;
      
      private var var_1339:int;
      
      private var var_441:Boolean = false;
      
      private var _isSelected:Boolean = false;
      
      private var var_1609:Boolean = false;
      
      private var var_684:BitmapData;
      
      private var var_2192:Date;
      
      public function Effect()
      {
         super();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get duration() : int
      {
         return this.var_1608;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_876;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_441;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_1609;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get icon() : BitmapData
      {
         return this.var_684;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_684;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(this.var_441)
         {
            _loc1_ = this.var_1339 - (new Date().valueOf() - this.var_2192.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1339;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1608 = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         this.var_1339 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_1609 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_684 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_876 = param1;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !this.var_441)
         {
            this.var_2192 = new Date();
         }
         this.var_441 = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_876;
         if(this.var_876 < 0)
         {
            this.var_876 = 0;
         }
         this.var_1339 = this.var_1608;
         this.var_441 = false;
         this.var_1609 = false;
      }
   }
}
