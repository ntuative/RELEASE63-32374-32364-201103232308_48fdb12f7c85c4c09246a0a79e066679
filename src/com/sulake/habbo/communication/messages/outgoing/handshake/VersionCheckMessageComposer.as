package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_2546:int;
      
      private var var_1398:String;
      
      private var var_2547:String;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         this.var_2546 = param1;
         this.var_1398 = param2;
         this.var_2547 = param3;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2546,this.var_1398,this.var_2547];
      }
   }
}
