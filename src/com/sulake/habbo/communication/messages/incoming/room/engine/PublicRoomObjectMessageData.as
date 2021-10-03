package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var _x:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_377:int = 0;
      
      private var var_488:int = 0;
      
      private var var_585:int = 0;
      
      private var var_182:Boolean = false;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function setReadOnly() : void
      {
         this.var_182 = true;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_182)
         {
            this._type = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_182)
         {
            this._name = param1;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_182)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_163;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_163 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_162;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_182)
         {
            this.var_162 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_377;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_377 = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_488;
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_488 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_585;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_182)
         {
            this.var_585 = param1;
         }
      }
   }
}
