package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_935:int = 10;
      
      private static const const_599:int = 20;
      
      private static const const_1276:int = 31;
      
      private static const const_1277:int = 32;
       
      
      private var var_293:Array;
      
      private var var_771:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
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
               this.var_293.push(const_1276);
               this.var_293.push(const_1277);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_935)
         {
            if(this.var_771)
            {
               this.var_771 = false;
               this.var_293 = new Array();
               this.var_293.push(const_935 + param1);
               this.var_293.push(const_599 + param1);
               this.var_293.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
