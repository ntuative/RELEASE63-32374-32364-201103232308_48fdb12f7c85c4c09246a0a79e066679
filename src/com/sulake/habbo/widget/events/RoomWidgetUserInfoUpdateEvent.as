package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_121:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_141:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_1156:int = 2;
      
      public static const const_1019:int = 3;
      
      public static const const_1621:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_1674:String = "";
      
      private var var_2185:int;
      
      private var var_2190:int = 0;
      
      private var var_2186:int = 0;
      
      private var var_621:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_258:Array;
      
      private var var_1815:Array;
      
      private var var_1526:int = 0;
      
      private var var_2524:String = "";
      
      private var var_2525:int = 0;
      
      private var var_2526:int = 0;
      
      private var var_2018:Boolean = false;
      
      private var var_1676:String = "";
      
      private var var_2758:Boolean = false;
      
      private var var_2756:Boolean = true;
      
      private var _respectLeft:int = 0;
      
      private var var_2760:Boolean = false;
      
      private var var_2763:Boolean = false;
      
      private var var_2761:Boolean = false;
      
      private var var_2764:Boolean = false;
      
      private var var_2759:Boolean = false;
      
      private var var_2757:Boolean = false;
      
      private var var_2762:int = 0;
      
      private var var_2019:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_258 = [];
         this.var_1815 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1674 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1674;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2185 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2185;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2190 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2190;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2186 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2186;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_621 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_621;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_258 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_258;
      }
      
      public function get givableBadges() : Array
      {
         return this.var_1815;
      }
      
      public function set givableBadges(param1:Array) : void
      {
         this.var_1815 = param1;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1526 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1526;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2524 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2524;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2758 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2758;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2760 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2760;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2763 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2763;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2761 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2761;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2764 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2764;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2759 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2759;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2757 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2757;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2762 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2762;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2756 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2756;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2019 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2019;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2525 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2525;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2526 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2526;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2018 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2018;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1676 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1676;
      }
   }
}
