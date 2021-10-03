package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_912:Array;
      
      private var var_2460:String;
      
      private var var_2459:String;
      
      private var var_2458:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_912 = param1;
         this.var_2460 = param2;
         this.var_2459 = param3;
         this.var_2458 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_912;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2460;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2459;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2458;
      }
   }
}
