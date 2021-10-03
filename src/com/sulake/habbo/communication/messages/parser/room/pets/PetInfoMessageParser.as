package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1678:int;
      
      private var _name:String;
      
      private var var_1366:int;
      
      private var var_2299:int;
      
      private var var_2238:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_621:String;
      
      private var var_2300:int;
      
      private var var_2298:int;
      
      private var var_2301:int;
      
      private var var_2302:int;
      
      private var var_2242:int;
      
      private var _ownerName:String;
      
      private var var_491:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1678;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1366;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2299;
      }
      
      public function get experience() : int
      {
         return this.var_2238;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_621;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2300;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2298;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2301;
      }
      
      public function get respect() : int
      {
         return this.var_2302;
      }
      
      public function get ownerId() : int
      {
         return this.var_2242;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_491;
      }
      
      public function flush() : Boolean
      {
         this.var_1678 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1678 = param1.readInteger();
         this._name = param1.readString();
         this.var_1366 = param1.readInteger();
         this.var_2299 = param1.readInteger();
         this.var_2238 = param1.readInteger();
         this.var_2300 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2298 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2301 = param1.readInteger();
         this.var_621 = param1.readString();
         this.var_2302 = param1.readInteger();
         this.var_2242 = param1.readInteger();
         this.var_491 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
