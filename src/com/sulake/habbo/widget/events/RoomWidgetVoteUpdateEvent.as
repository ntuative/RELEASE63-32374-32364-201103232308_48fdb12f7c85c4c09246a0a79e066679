package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_136:String = "RWPUE_VOTE_QUESTION";
      
      public static const const_154:String = "RWPUE_VOTE_RESULT";
       
      
      private var var_1153:String;
      
      private var var_1368:Array;
      
      private var var_1244:Array;
      
      private var var_1687:int;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_1153 = param2;
         this.var_1368 = param3;
         this.var_1244 = param4;
         if(this.var_1244 == null)
         {
            this.var_1244 = [];
         }
         this.var_1687 = param5;
      }
      
      public function get question() : String
      {
         return this.var_1153;
      }
      
      public function get choices() : Array
      {
         return this.var_1368.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1244.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1687;
      }
   }
}
