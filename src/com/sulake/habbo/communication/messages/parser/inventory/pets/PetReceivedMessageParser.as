package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1651:Boolean;
      
      private var var_887:PetData;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1651 = param1.readBoolean();
         this.var_887 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1651 + ", " + this.var_887.id + ", " + this.var_887.name + ", " + this.var_887.type + ", " + this.var_887.breed + ", " + this.pet.color);
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1651;
      }
      
      public function get pet() : PetData
      {
         return this.var_887;
      }
   }
}
