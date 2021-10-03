package com.sulake.room.object
{
   import flash.utils.Dictionary;
   
   public class RoomObjectModel implements IRoomObjectModelController
   {
       
      
      private var var_602:Dictionary;
      
      private var var_601:Dictionary;
      
      private var var_651:Dictionary;
      
      private var var_652:Dictionary;
      
      private var var_1377:Array;
      
      private var var_1378:Array;
      
      private var _numberArrayReadOnlyList:Array;
      
      private var _stringArrayReadOnlyList:Array;
      
      private var _updateID:int;
      
      public function RoomObjectModel()
      {
         super();
         this.var_602 = new Dictionary();
         this.var_601 = new Dictionary();
         this.var_651 = new Dictionary();
         this.var_652 = new Dictionary();
         this.var_1377 = [];
         this.var_1378 = [];
         this._numberArrayReadOnlyList = [];
         this._stringArrayReadOnlyList = [];
         this._updateID = 0;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_602 != null)
         {
            for(_loc1_ in this.var_602)
            {
               delete this.var_602[_loc1_];
            }
            this.var_602 = null;
         }
         if(this.var_601 != null)
         {
            for(_loc1_ in this.var_601)
            {
               delete this.var_601[_loc1_];
            }
            this.var_601 = null;
         }
         if(this.var_651 != null)
         {
            for(_loc1_ in this.var_651)
            {
               delete this.var_651[_loc1_];
            }
            this.var_651 = null;
         }
         if(this.var_652 != null)
         {
            for(_loc1_ in this.var_652)
            {
               delete this.var_652[_loc1_];
            }
            this.var_652 = null;
         }
         this.var_1378 = [];
         this.var_1377 = [];
         this._stringArrayReadOnlyList = [];
         this._numberArrayReadOnlyList = [];
      }
      
      public function getNumber(param1:String) : Number
      {
         return this.var_602[param1];
      }
      
      public function getString(param1:String) : String
      {
         return this.var_601[param1];
      }
      
      public function getNumberArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_651[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function getStringArray(param1:String) : Array
      {
         var _loc2_:Array = this.var_652[param1];
         if(_loc2_ != null)
         {
            _loc2_ = _loc2_.slice();
         }
         return _loc2_;
      }
      
      public function setNumber(param1:String, param2:Number, param3:Boolean = false) : void
      {
         if(this.var_1377.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1377.push(param1);
         }
         if(this.var_602[param1] != param2)
         {
            this.var_602[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setString(param1:String, param2:String, param3:Boolean = false) : void
      {
         if(this.var_1378.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this.var_1378.push(param1);
         }
         if(this.var_601[param1] != param2)
         {
            this.var_601[param1] = param2;
            ++this._updateID;
         }
      }
      
      public function setNumberArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._numberArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._numberArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is Number)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_651[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as Number != _loc6_[_loc5_] as Number)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_651[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function setStringArray(param1:String, param2:Array, param3:Boolean = false) : void
      {
         if(param2 == null)
         {
            return;
         }
         if(this._stringArrayReadOnlyList.indexOf(param1) >= 0)
         {
            return;
         }
         if(param3)
         {
            this._stringArrayReadOnlyList.push(param1);
         }
         var _loc4_:* = [];
         var _loc5_:int = 0;
         _loc5_ = 0;
         while(_loc5_ < param2.length)
         {
            if(param2[_loc5_] is String)
            {
               _loc4_.push(param2[_loc5_]);
            }
            _loc5_++;
         }
         var _loc6_:Array = this.var_652[param1];
         var _loc7_:Boolean = true;
         if(_loc6_ != null && _loc6_.length == _loc4_.length)
         {
            _loc5_ = _loc4_.length - 1;
            while(_loc5_ >= 0)
            {
               if(_loc4_[_loc5_] as String != _loc6_[_loc5_] as String)
               {
                  _loc7_ = false;
                  break;
               }
               _loc5_--;
            }
         }
         else
         {
            _loc7_ = false;
         }
         if(_loc7_)
         {
            return;
         }
         this.var_652[param1] = _loc4_;
         ++this._updateID;
      }
      
      public function getUpdateID() : int
      {
         return this._updateID;
      }
   }
}
