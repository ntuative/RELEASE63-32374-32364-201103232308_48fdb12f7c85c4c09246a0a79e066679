package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_580:int = 0;
      
      public static const const_185:int = 1;
      
      public static const const_110:int = 2;
      
      public static const const_723:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1797:String;
      
      private var var_2412:int;
      
      private var var_1409:int;
      
      private var var_2469:int;
      
      private var var_2655:int;
      
      private var var_846:Array;
      
      private var var_2471:Array;
      
      private var var_2656:int;
      
      private var var_2413:Boolean;
      
      private var var_2472:Boolean;
      
      private var var_2470:Boolean;
      
      private var var_2473:Boolean;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2413;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2413 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2472;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2472 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2470;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2470 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2473;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2473 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1797;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1797 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2412;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2412 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1409;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1409 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2469;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2469 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2655;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2655 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_846;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_846 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2471;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2471 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2656;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2656 = param1;
      }
   }
}
