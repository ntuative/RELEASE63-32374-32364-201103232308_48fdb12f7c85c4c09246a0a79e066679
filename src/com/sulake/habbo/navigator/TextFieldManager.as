package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var _navigator:HabboNavigator;
      
      private var var_80:ITextFieldWindow;
      
      private var var_678:Boolean;
      
      private var var_1541:String = "";
      
      private var var_1995:int;
      
      private var var_1996:Function;
      
      private var var_2776:String = "";
      
      private var var_144:IWindowContainer;
      
      private var var_2777:Boolean;
      
      private var _orgTextBackgroundColor:uint;
      
      private var var_2778:uint;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         this._navigator = param1;
         this.var_80 = param2;
         this.var_1995 = param3;
         this.var_1996 = param4;
         if(param5 != null)
         {
            this.var_678 = true;
            this.var_1541 = param5;
            this.var_80.text = param5;
         }
         Util.setProcDirectly(this.var_80,this.onInputClick);
         this.var_80.addEventListener(WindowKeyboardEvent.const_198,this.checkEnterPress);
         this.var_80.addEventListener(WindowEvent.const_103,this.checkMaxLen);
         this.var_2777 = this.var_80.textBackground;
         this._orgTextBackgroundColor = this.var_80.textBackgroundColor;
         this.var_2778 = this.var_80.textColor;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!this.isInputValid())
         {
            this.displayError(param1);
            return false;
         }
         this.restoreBackground();
         return true;
      }
      
      public function restoreBackground() : void
      {
         this.var_80.textBackground = this.var_2777;
         this.var_80.textBackgroundColor = this._orgTextBackgroundColor;
         this.var_80.textColor = this.var_2778;
      }
      
      public function displayError(param1:String) : void
      {
         this.var_80.textBackground = true;
         this.var_80.textBackgroundColor = 4294021019;
         this.var_80.textColor = 4278190080;
         if(this.var_144 == null)
         {
            this.var_144 = IWindowContainer(this._navigator.getXmlWindow("nav_error_popup"));
            this._navigator.refreshButton(this.var_144,"popup_arrow_down",true,null,0);
            IWindowContainer(this.var_80.parent).addChild(this.var_144);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_144.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         this.var_144.findChildByName("border").width = _loc2_.width + 15;
         this.var_144.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         this.var_80.getLocalPosition(_loc3_);
         this.var_144.x = _loc3_.x;
         this.var_144.y = _loc3_.y - this.var_144.height + 3;
         var _loc4_:IWindow = this.var_144.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_144.width / 2 - _loc4_.width / 2;
         this.var_144.x += (this.var_80.width - this.var_144.width) / 2;
         this.var_144.visible = true;
      }
      
      public function goBackToInitialState() : void
      {
         this.clearErrors();
         if(this.var_1541 != null)
         {
            this.var_80.text = this.var_1541;
            this.var_678 = true;
         }
         else
         {
            this.var_80.text = "";
            this.var_678 = false;
         }
      }
      
      public function getText() : String
      {
         if(this.var_678)
         {
            return this.var_2776;
         }
         return this.var_80.text;
      }
      
      public function setText(param1:String) : void
      {
         this.var_678 = false;
         this.var_80.text = param1;
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_144 != null)
         {
            this.var_144.visible = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return this.var_80;
      }
      
      private function isInputValid() : Boolean
      {
         return !this.var_678 && Util.trim(this.getText()).length > 2;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_295)
         {
            return;
         }
         if(!this.var_678)
         {
            return;
         }
         this.var_80.text = this.var_2776;
         this.var_678 = false;
         this.restoreBackground();
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(this.var_1996 != null)
            {
               this.var_1996();
            }
         }
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = this.var_80.text;
         if(_loc2_.length > this.var_1995)
         {
            this.var_80.text = _loc2_.substring(0,this.var_1995);
         }
      }
   }
}
