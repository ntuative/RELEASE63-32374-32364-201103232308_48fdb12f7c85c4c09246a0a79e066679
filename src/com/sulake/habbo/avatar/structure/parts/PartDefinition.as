package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2252:String;
      
      private var var_1640:String;
      
      private var var_2251:String;
      
      private var var_1641:Boolean;
      
      private var var_1642:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2252 = String(param1["set-type"]);
         this.var_1640 = String(param1["flipped-set-type"]);
         this.var_2251 = String(param1["remove-set-type"]);
         this.var_1641 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1642 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1642;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1642 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2252;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1640;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2251;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1641;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1641 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1640 = param1;
      }
   }
}
