package com.sulake.habbo.avatar.pets
{
   import flash.geom.ColorTransform;
   
   public class PetColor extends PetEditorInfo implements IPetColor
   {
       
      
      private var _id:int;
      
      private var _rgb:uint;
      
      private var var_1571:uint;
      
      private var var_1572:uint;
      
      private var _b:uint;
      
      private var var_926:ColorTransform;
      
      private var var_1744:Number;
      
      private var var_1743:Number;
      
      private var var_1745:Number;
      
      private var var_2097:int;
      
      public function PetColor(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         var _loc2_:String = param1.text();
         this._rgb = parseInt(_loc2_,16);
         this.var_1571 = this._rgb >> 16 & 255;
         this.var_1572 = this._rgb >> 8 & 255;
         this._b = this._rgb >> 0 & 255;
         this.var_1744 = this.var_1571 / 255 * 1;
         this.var_1743 = this.var_1572 / 255 * 1;
         this.var_1745 = this._b / 255 * 1;
         this.var_926 = new ColorTransform(this.var_1744,this.var_1743,this.var_1745);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get rgb() : uint
      {
         return this._rgb;
      }
      
      public function get r() : uint
      {
         return this.var_1571;
      }
      
      public function get g() : uint
      {
         return this.var_1572;
      }
      
      public function get b() : uint
      {
         return this._b;
      }
      
      public function get colorTransform() : ColorTransform
      {
         return this.var_926;
      }
      
      public function get figurePartPaletteColorId() : int
      {
         return this.var_2097;
      }
      
      public function set figurePartPaletteColorId(param1:int) : void
      {
         this.var_2097 = param1;
      }
   }
}
