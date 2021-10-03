package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_967:int = 3;
       
      
      private var var_2558:int = -1;
      
      private var var_2560:int = -2;
      
      private var var_370:Vector3d = null;
      
      private var var_436:Vector3d = null;
      
      private var var_1834:Vector3d;
      
      private var var_2557:Boolean = false;
      
      private var _limitedLocY:Boolean = false;
      
      private var var_2561:Boolean = false;
      
      private var var_2565:Boolean = false;
      
      private var var_2564:int = 0;
      
      private var var_2559:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2562:int = 0;
      
      private var var_2563:int = 0;
      
      private var var_1592:int = -1;
      
      private var var_1445:int = 0;
      
      public function RoomCamera()
      {
         this.var_1834 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_436;
      }
      
      public function get targetId() : int
      {
         return this.var_2558;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2560;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1834;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2557;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this._limitedLocY;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2561;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2565;
      }
      
      public function get screenWd() : int
      {
         return this.var_2564;
      }
      
      public function get screenHt() : int
      {
         return this.var_2559;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2562;
      }
      
      public function get roomHt() : int
      {
         return this.var_2563;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1592;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2558 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1834.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2560 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2557 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this._limitedLocY = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2561 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2565 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2564 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2559 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         this._scale = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2562 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2563 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1592 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(this.var_370 == null)
         {
            this.var_370 = new Vector3d();
         }
         if(this.var_370.x != param1.x || this.var_370.y != param1.y || this.var_370.z != param1.z)
         {
            this.var_370.assign(param1);
            this.var_1445 = 0;
         }
      }
      
      public function dispose() : void
      {
         this.var_370 = null;
         this.var_436 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_436 != null)
         {
            return;
         }
         this.var_436 = new Vector3d();
         this.var_436.assign(param1);
      }
      
      public function update(param1:uint, param2:Number, param3:Number) : void
      {
         var _loc4_:* = null;
         if(this.var_370 != null && this.var_436 != null)
         {
            ++this.var_1445;
            _loc4_ = Vector3d.dif(this.var_370,this.var_436);
            if(_loc4_.length <= param2)
            {
               this.var_436 = this.var_370;
               this.var_370 = null;
            }
            else
            {
               _loc4_.div(_loc4_.length);
               if(_loc4_.length < param2 * (const_967 + 1))
               {
                  _loc4_.mul(param2);
               }
               else if(this.var_1445 <= const_967)
               {
                  _loc4_.mul(param2);
               }
               else
               {
                  _loc4_.mul(param3);
               }
               this.var_436 = Vector3d.sum(this.var_436,_loc4_);
            }
         }
      }
   }
}
