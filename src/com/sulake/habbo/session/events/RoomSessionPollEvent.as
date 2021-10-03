package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionPollEvent extends RoomSessionEvent
   {
      
      public static const const_127:String = "RSPE_POLL_OFFER";
      
      public static const const_66:String = "RSPE_POLL_ERROR";
      
      public static const const_139:String = "RSPE_POLL_CONTENT";
       
      
      private var _id:int = -1;
      
      private var var_1818:String;
      
      private var var_1520:int = 0;
      
      private var var_1957:String = "";
      
      private var var_1956:String = "";
      
      private var var_1519:Array = null;
      
      public function RoomSessionPollEvent(param1:String, param2:IRoomSession, param3:int)
      {
         this._id = param3;
         super(param1,param2);
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get summary() : String
      {
         return this.var_1818;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1818 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1520;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1520 = param1;
      }
      
      public function get startMessage() : String
      {
         return this.var_1957;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_1957 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_1956;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_1956 = param1;
      }
      
      public function get questionArray() : Array
      {
         return this.var_1519;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1519 = param1;
      }
   }
}
