package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2288:int = 0;
      
      private var var_1547:String = "";
      
      private var var_2012:String = "";
      
      private var var_2643:String = "";
      
      private var var_2644:String = "";
      
      private var var_1886:int = 0;
      
      private var var_2642:int = 0;
      
      private var var_2645:int = 0;
      
      private var var_1548:int = 0;
      
      private var var_2641:int = 0;
      
      private var var_1546:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2288 = param1;
         this.var_1547 = param2;
         this.var_2012 = param3;
         this.var_2643 = param4;
         this.var_2644 = param5;
         if(param6)
         {
            this.var_1886 = 1;
         }
         else
         {
            this.var_1886 = 0;
         }
         this.var_2642 = param7;
         this.var_2645 = param8;
         this.var_1548 = param9;
         this.var_2641 = param10;
         this.var_1546 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2288,this.var_1547,this.var_2012,this.var_2643,this.var_2644,this.var_1886,this.var_2642,this.var_2645,this.var_1548,this.var_2641,this.var_1546];
      }
   }
}
