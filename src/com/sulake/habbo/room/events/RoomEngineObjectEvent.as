package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_842:String = "REOE_OBJECT_SELECTED";
      
      public static const const_591:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_397:String = "REOB_OBJECT_ADDED";
      
      public static const const_750:String = "REOE_OBJECT_REMOVED";
      
      public static const const_167:String = "REOB_OBJECT_PLACED";
      
      public static const const_909:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_128:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_142:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_145:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_149:String = "REOE_WIDGET_REQUEST_TROPHY";
      
      public static const ROOM_OBJECT_WIDGET_REQUEST_TEASER:String = "REOE_WIDGET_REQUEST_TEASER";
      
      public static const const_130:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_131:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_104:String = "REOR_REMOVE_DIMMER";
      
      public static const const_132:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_156:String = "REOR_WIDGET_REQUEST_PLAYLIST_EDITOR";
      
      public static const const_533:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const const_523:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_521:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_502:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
       
      
      private var var_391:int;
      
      private var _category:int;
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_391 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_391;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
