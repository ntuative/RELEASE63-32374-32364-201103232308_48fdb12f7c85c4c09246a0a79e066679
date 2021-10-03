package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatCategory
   {
       
      
      private var var_1937:int;
      
      private var var_2330:String;
      
      private var var_304:Boolean;
      
      public function FlatCategory(param1:IMessageDataWrapper)
      {
         super();
         this.var_1937 = param1.readInteger();
         this.var_2330 = param1.readString();
         this.var_304 = param1.readBoolean();
      }
      
      public function get nodeId() : int
      {
         return this.var_1937;
      }
      
      public function get nodeName() : String
      {
         return this.var_2330;
      }
      
      public function get visible() : Boolean
      {
         return this.var_304;
      }
   }
}
