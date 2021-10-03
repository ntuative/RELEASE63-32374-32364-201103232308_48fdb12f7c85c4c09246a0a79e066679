package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_743:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1246:String = "inventory_effects";
      
      public static const const_1130:String = "inventory_badges";
      
      public static const const_1702:String = "inventory_clothes";
      
      public static const const_1683:String = "inventory_furniture";
       
      
      private var var_2274:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_743);
         this.var_2274 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2274;
      }
   }
}
