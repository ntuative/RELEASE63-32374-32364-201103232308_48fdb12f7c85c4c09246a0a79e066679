package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1277:int = 3;
      
      private static const const_1388:int = 2;
      
      private static const const_1387:int = 1;
      
      private static const const_1389:int = 15;
       
      
      private var var_293:Array;
      
      private var var_1190:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_293 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1388)
         {
            this.var_293 = new Array();
            this.var_293.push(const_1387);
            this.var_1190 = const_1389;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1190 > 0)
         {
            --this.var_1190;
         }
         if(this.var_1190 == 0)
         {
            if(this.var_293.length > 0)
            {
               super.setAnimation(this.var_293.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
