package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2228:int;
      
      private var var_1549:String;
      
      private var _objId:int;
      
      private var var_1853:int;
      
      private var _category:int;
      
      private var var_2071:String;
      
      private var var_2724:Boolean;
      
      private var var_2723:Boolean;
      
      private var var_2725:Boolean;
      
      private var var_2659:Boolean;
      
      private var var_2266:int;
      
      private var var_1389:int;
      
      private var var_1788:String = "";
      
      private var var_2079:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2228 = param1;
         this.var_1549 = param2;
         this._objId = param3;
         this.var_1853 = param4;
         this._category = param5;
         this.var_2071 = param6;
         this.var_2724 = param7;
         this.var_2723 = param8;
         this.var_2725 = param9;
         this.var_2659 = param10;
         this.var_2266 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1788 = param1;
         this.var_1389 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2228;
      }
      
      public function get itemType() : String
      {
         return this.var_1549;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1853;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2071;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2724;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2723;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2725;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2659;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2266;
      }
      
      public function get slotId() : String
      {
         return this.var_1788;
      }
      
      public function get songId() : int
      {
         return this.var_2079;
      }
      
      public function get extra() : int
      {
         return this.var_1389;
      }
   }
}
