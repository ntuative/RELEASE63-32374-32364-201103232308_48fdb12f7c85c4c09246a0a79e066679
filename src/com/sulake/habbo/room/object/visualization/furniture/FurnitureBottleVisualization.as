package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_935:int = 20;
      
      private static const const_599:int = 9;
      
      private static const const_1277:int = -1;
       
      
      private var var_293:Array;
      
      private var var_771:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_293 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_771)
            {
               this.var_771 = true;
               this.var_293 = new Array();
               this.var_293.push(const_1277);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_771)
            {
               this.var_771 = false;
               this.var_293 = new Array();
               this.var_293.push(const_935);
               this.var_293.push(const_599 + param1);
               this.var_293.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
