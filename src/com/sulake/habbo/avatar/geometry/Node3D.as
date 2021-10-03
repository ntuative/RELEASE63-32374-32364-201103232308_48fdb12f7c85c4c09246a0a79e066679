package com.sulake.habbo.avatar.geometry
{
   public class Node3D
   {
       
      
      private var var_533:Vector3D;
      
      private var var_1729:Vector3D;
      
      private var var_2372:Boolean = false;
      
      public function Node3D(param1:Number, param2:Number, param3:Number)
      {
         this.var_1729 = new Vector3D();
         super();
         this.var_533 = new Vector3D(param1,param2,param3);
         if(param1 != 0 || param2 != 0 || param3 != 0)
         {
            this.var_2372 = true;
         }
      }
      
      public function get location() : Vector3D
      {
         return this.var_533;
      }
      
      public function get transformedLocation() : Vector3D
      {
         return this.var_1729;
      }
      
      public function applyTransform(param1:Matrix4x4) : void
      {
         if(this.var_2372)
         {
            this.var_1729 = param1.vectorMultiplication(this.var_533);
         }
      }
   }
}
