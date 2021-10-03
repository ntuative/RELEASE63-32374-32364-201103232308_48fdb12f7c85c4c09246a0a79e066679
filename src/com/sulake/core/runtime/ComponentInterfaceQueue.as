package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1821:IID;
      
      private var var_691:Boolean;
      
      private var var_1165:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1821 = param1;
         this.var_1165 = new Array();
         this.var_691 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1821;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_691;
      }
      
      public function get receivers() : Array
      {
         return this.var_1165;
      }
      
      public function dispose() : void
      {
         if(!this.var_691)
         {
            this.var_691 = true;
            this.var_1821 = null;
            while(this.var_1165.length > 0)
            {
               this.var_1165.pop();
            }
            this.var_1165 = null;
         }
      }
   }
}
