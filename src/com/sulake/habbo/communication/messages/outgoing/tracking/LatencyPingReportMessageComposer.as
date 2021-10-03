package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2277:int;
      
      private var var_2278:int;
      
      private var var_2276:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2277 = param1;
         this.var_2278 = param2;
         this.var_2276 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2277,this.var_2278,this.var_2276];
      }
      
      public function dispose() : void
      {
      }
   }
}
