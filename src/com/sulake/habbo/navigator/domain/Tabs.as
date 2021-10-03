package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_351:int = 1;
      
      public static const const_224:int = 2;
      
      public static const const_297:int = 3;
      
      public static const const_346:int = 4;
      
      public static const const_235:int = 5;
      
      public static const const_357:int = 1;
      
      public static const const_698:int = 2;
      
      public static const const_809:int = 3;
      
      public static const const_638:int = 4;
      
      public static const const_271:int = 5;
      
      public static const const_905:int = 6;
      
      public static const const_633:int = 7;
      
      public static const const_257:int = 8;
      
      public static const const_383:int = 9;
      
      public static const const_1823:int = 10;
      
      public static const const_714:int = 11;
      
      public static const const_559:int = 12;
       
      
      private var var_425:Array;
      
      private var _navigator:HabboNavigator;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_425 = new Array();
         this.var_425.push(new Tab(this._navigator,const_351,const_559,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_510));
         this.var_425.push(new Tab(this._navigator,const_224,const_357,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_510));
         this.var_425.push(new Tab(this._navigator,const_346,const_714,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_1147));
         this.var_425.push(new Tab(this._navigator,const_297,const_271,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_510));
         this.var_425.push(new Tab(this._navigator,const_235,const_257,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_693));
         this.setSelectedTab(const_351);
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_346;
      }
      
      public function get tabs() : Array
      {
         return this.var_425;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_425)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_425)
         {
            _loc1_.selected = false;
         }
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_425)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}
