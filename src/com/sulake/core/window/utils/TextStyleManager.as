package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.text.StyleSheet;
   
   public class TextStyleManager
   {
      
      public static const const_204:String = "regular";
      
      public static const ITALIC:String = "italic";
      
      public static const BOLD:String = "bold";
      
      private static var var_86:Map;
      
      private static var var_487:Array;
      
      private static var _eventDispatcher:IEventDispatcher;
      
      private static const const_606:String = "{";
      
      private static const const_605:String = "}";
      
      private static const const_1314:String = "/*";
      
      private static const const_1313:String = "*/";
      
      {
         init();
      }
      
      public function TextStyleManager()
      {
         super();
      }
      
      public static function get events() : IEventDispatcher
      {
         return _eventDispatcher;
      }
      
      private static function init() : void
      {
         var _loc1_:* = null;
         var_86 = new Map();
         var_487 = new Array();
         _eventDispatcher = new EventDispatcher();
         _loc1_ = new TextStyle();
         _loc1_.name = const_204;
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "normal";
         var_86[_loc1_.name] = _loc1_;
         var_487.push(_loc1_.name);
         _loc1_ = new TextStyle();
         _loc1_.name = ITALIC;
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "italic";
         _loc1_.fontWeight = "normal";
         var_86[_loc1_.name] = _loc1_;
         var_487.push(_loc1_.name);
         _loc1_ = new TextStyle();
         _loc1_.name = BOLD;
         _loc1_.color = 0;
         _loc1_.fontSize = "9";
         _loc1_.fontFamily = "Courier";
         _loc1_.fontStyle = "normal";
         _loc1_.fontWeight = "bold";
         var_86[_loc1_.name] = _loc1_;
         var_487.push(_loc1_.name);
      }
      
      public static function getStyle(param1:String) : TextStyle
      {
         return var_86[param1];
      }
      
      public static function getStyleWithIndex(param1:int) : TextStyle
      {
         return var_86.getWithIndex(param1);
      }
      
      public static function setStyle(param1:String, param2:TextStyle) : void
      {
         var _loc3_:* = var_86.getKeys().indexOf(param1) == -1;
         param2.name = param1;
         var_86[param1] = param2;
         if(_loc3_)
         {
            var_487.push(param1);
            _eventDispatcher.dispatchEvent(new Event(Event.ADDED));
         }
         else
         {
            _eventDispatcher.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public static function setStyles(param1:Array, param2:Boolean = false) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(param2)
         {
            _loc5_ = [var_86[const_204],var_86[ITALIC],var_86[BOLD]];
            var_86.reset();
            var_86[const_204] = _loc5_[0];
            var_86[ITALIC] = _loc5_[1];
            var_86[BOLD] = _loc5_[2];
         }
         var _loc3_:int = 0;
         for each(_loc4_ in param1)
         {
            var_86[_loc4_.name] = _loc4_;
            if(var_487.indexOf(_loc4_.name) == -1)
            {
               var_487.push(_loc4_.name);
            }
         }
         _eventDispatcher.dispatchEvent(new Event(Event.CHANGE));
         if(var_86.length != _loc3_)
         {
            _eventDispatcher.dispatchEvent(new Event(Event.ADDED));
         }
      }
      
      public static function findMatchingTextStyle(param1:String) : TextStyle
      {
         var _loc3_:* = null;
         var _loc2_:TextStyle = parseCSS(param1)[0] as TextStyle;
         if(_loc2_)
         {
            _loc3_ = var_86[_loc2_.name];
            if(_loc3_ && _loc3_.equals(_loc2_))
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function enumerateStyles() : Array
      {
         var _loc1_:Array = new Array();
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc1_.push(var_86.getWithIndex(_loc3_));
            _loc3_++;
         }
         return _loc1_;
      }
      
      public static function enumerateStyleNames() : Array
      {
         return var_86.getKeys();
      }
      
      public static function getStyleNameArrayRef() : Array
      {
         return var_487;
      }
      
      public static function parseCSS(param1:String) : Array
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:StyleSheet = new StyleSheet();
         _loc2_.parseCSS(param1);
         var _loc3_:Array = parseStyleNamesFromCSS(param1);
         var _loc4_:Array = new Array();
         for each(_loc7_ in _loc3_)
         {
            _loc5_ = _loc2_.getStyle(_loc7_);
            _loc6_ = new TextStyle();
            _loc6_.name = _loc7_;
            _loc6_.color = !!_loc5_.color ? uint(String(_loc5_.color).replace("#","0x")) : null;
            _loc6_.fontFamily = !!_loc5_.fontFamily ? _loc5_.fontFamily : null;
            _loc6_.fontSize = !!_loc5_.fontSize ? parseInt(String(_loc5_.fontSize)) : null;
            _loc6_.fontStyle = !!_loc5_.fontStyle ? _loc5_.fontStyle : null;
            _loc6_.fontWeight = !!_loc5_.fontWeight ? _loc5_.fontWeight : null;
            _loc6_.kerning = !!_loc5_.kerning ? _loc5_.kerning == "ParkBusCannotEnterMessageEvent" : null;
            _loc6_.leading = !!_loc5_.leading ? parseInt(String(_loc5_.leading)) : null;
            _loc6_.letterSpacing = !!_loc5_.letterSpacing ? parseInt(_loc5_.letterSpacing.toString()) : null;
            _loc6_.textDecoration = !!_loc5_.textDecoration ? _loc5_.textDecoration : null;
            _loc6_.textIndent = !!_loc5_.textIndent ? parseInt(_loc5_.textIndent.toString()) : null;
            _loc6_.antiAliasType = !!_loc5_.antiAliasType ? _loc5_.antiAliasType : null;
            _loc6_.sharpness = !!_loc5_.sharpness ? parseInt(_loc5_.sharpness) : null;
            _loc6_.thickness = !!_loc5_.thickness ? parseInt(_loc5_.thickness) : null;
            _loc4_.push(_loc6_);
         }
         return _loc4_;
      }
      
      private static function parseStyleNamesFromCSS(param1:String) : Array
      {
         var _loc5_:* = null;
         var _loc2_:* = [];
         var _loc3_:String = param1;
         _loc3_ = _loc3_.split("\t").join("");
         _loc3_ = _loc3_.split("\n").join("");
         _loc3_ = _loc3_.split("\r").join("");
         var _loc4_:Array = _loc3_.split(const_605);
         if(countSubStrings(param1,const_606) != countSubStrings(param1,const_605))
         {
            throw new Error("Mismatching amount of \"" + const_606 + "\" versus \"" + const_605 + "\", please check the CSS!");
         }
         for each(_loc5_ in _loc4_)
         {
            while(_loc5_.indexOf(const_1314) == 0)
            {
               _loc5_ = _loc5_.substring(_loc5_.indexOf(const_1313) + 2,_loc5_.length);
            }
            _loc5_ = _loc5_.slice(0,_loc5_.indexOf(const_606)).split(" ").join("");
            if(_loc5_.length)
            {
               _loc2_.push(_loc5_);
            }
         }
         return _loc2_;
      }
      
      private static function countSubStrings(param1:String, param2:String) : int
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         while((_loc4_ = param1.indexOf(param2,_loc4_)) != -1)
         {
            _loc4_++;
            _loc3_++;
         }
         return _loc3_;
      }
      
      public static function toString() : String
      {
         var _loc3_:* = null;
         var _loc1_:Array = enumerateStyles();
         var _loc2_:String = "";
         for each(_loc3_ in _loc1_)
         {
            _loc2_ += _loc3_.toString() + "\n\n";
         }
         return _loc2_;
      }
   }
}
