package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class OpenPetPackageMessageComposer implements IMessageComposer
   {
       
      
      private var var_391:int;
      
      private var var_2178:String;
      
      public function OpenPetPackageMessageComposer(param1:int, param2:String)
      {
         super();
         this.var_391 = param1;
         this.var_2178 = param2;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_391,this.var_2178];
      }
      
      public function dispose() : void
      {
      }
   }
}
