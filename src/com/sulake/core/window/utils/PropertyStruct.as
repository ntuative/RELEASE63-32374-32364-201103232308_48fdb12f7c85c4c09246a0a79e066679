package com.sulake.core.window.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getQualifiedClassName;
   
   public class PropertyStruct
   {
      
      public static const const_124:String = "hex";
      
      public static const const_41:String = "int";
      
      public static const const_234:String = "uint";
      
      public static const const_265:String = "Number";
      
      public static const const_37:String = "Boolean";
      
      public static const const_56:String = "String";
      
      public static const const_263:String = "Point";
      
      public static const const_222:String = "Rectangle";
      
      public static const const_146:String = "Array";
      
      public static const const_240:String = "Map";
       
      
      private var var_647:String;
      
      private var var_190:Object;
      
      private var _type:String;
      
      private var var_2620:Boolean;
      
      private var var_2877:Boolean;
      
      private var var_2619:Array;
      
      public function PropertyStruct(param1:String, param2:Object, param3:String, param4:Boolean, param5:Array = null)
      {
         super();
         this.var_647 = param1;
         this.var_190 = param2;
         this._type = param3;
         this.var_2620 = param4;
         this.var_2877 = param3 == const_240 || param3 == const_146 || param3 == const_263 || param3 == const_222;
         this.var_2619 = param5;
      }
      
      public function get key() : String
      {
         return this.var_647;
      }
      
      public function get value() : Object
      {
         return this.var_190;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get valid() : Boolean
      {
         return this.var_2620;
      }
      
      public function get range() : Array
      {
         return this.var_2619;
      }
      
      public function toString() : String
      {
         switch(this._type)
         {
            case const_124:
               return "0x" + uint(this.var_190).toString(16);
            case const_37:
               return Boolean(this.var_190) == true ? "ParkBusCannotEnterMessageEvent" : "false";
            case const_263:
               return "Point(" + Point(this.var_190).x + ", " + Point(this.var_190).y + ")";
            case const_222:
               return "Rectangle(" + Rectangle(this.var_190).x + ", " + Rectangle(this.var_190).y + ", " + Rectangle(this.var_190).width + ", " + Rectangle(this.var_190).height + ")";
            default:
               return String(this.value);
         }
      }
      
      public function toXMLString() : String
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         switch(this._type)
         {
            case const_240:
               _loc3_ = this.var_190 as Map;
               _loc1_ = "<var key=\"" + this.var_647 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc3_.length)
               {
                  _loc1_ += "<var key=\"" + _loc3_.getKey(_loc2_) + "\" value=\"" + _loc3_.getWithIndex(_loc2_) + "\" type=\"" + getQualifiedClassName(_loc3_.getWithIndex(_loc2_)) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_146:
               _loc4_ = this.var_190 as Array;
               _loc1_ = "<var key=\"" + this.var_647 + "\">\r<value>\r<" + this._type + ">\r";
               _loc2_ = 0;
               while(_loc2_ < _loc4_.length)
               {
                  _loc1_ += "<var key=\"" + String(_loc2_) + "\" value=\"" + _loc4_[_loc2_] + "\" type=\"" + getQualifiedClassName(_loc4_[_loc2_]) + "\" />\r";
                  _loc2_++;
               }
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_263:
               _loc5_ = this.var_190 as Point;
               _loc1_ = "<var key=\"" + this.var_647 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc5_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc5_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_222:
               _loc6_ = this.var_190 as Rectangle;
               _loc1_ = "<var key=\"" + this.var_647 + "\">\r<value>\r<" + this._type + ">\r";
               _loc1_ += "<var key=\"x\" value=\"" + _loc6_.x + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"y\" value=\"" + _loc6_.y + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"width\" value=\"" + _loc6_.width + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "<var key=\"height\" value=\"" + _loc6_.height + "\" type=\"" + const_41 + "\" />\r";
               _loc1_ += "</" + this._type + ">\r</value>\r</var>";
               break;
            case const_124:
               _loc1_ = "<var key=\"" + this.var_647 + "\" value=\"" + "0x" + uint(this.var_190).toString(16) + "\" type=\"" + this._type + "\" />";
               break;
            default:
               _loc1_ = "<var key=\"" + this.var_647 + "\" value=\"" + this.var_190 + "\" type=\"" + this._type + "\" />";
         }
         return _loc1_;
      }
   }
}
