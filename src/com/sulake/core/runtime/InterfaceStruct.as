package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1489:IID;
      
      private var var_1905:String;
      
      private var var_105:IUnknown;
      
      private var var_793:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1489 = param1;
         this.var_1905 = getQualifiedClassName(this.var_1489);
         this.var_105 = param2;
         this.var_793 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1489;
      }
      
      public function get iis() : String
      {
         return this.var_1905;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_105;
      }
      
      public function get references() : uint
      {
         return this.var_793;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_105 == null;
      }
      
      public function dispose() : void
      {
         this.var_1489 = null;
         this.var_1905 = null;
         this.var_105 = null;
         this.var_793 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_793;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_793) : uint(0);
      }
   }
}
