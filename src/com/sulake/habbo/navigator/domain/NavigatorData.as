package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1757:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_204:MsgWithRequestId;
      
      private var var_624:RoomEventData;
      
      private var var_2489:Boolean;
      
      private var var_2493:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2119:int;
      
      private var var_265:GuestRoomData;
      
      private var var_938:PublicRoomShortData;
      
      private var var_2492:int;
      
      private var var_2496:Boolean;
      
      private var var_2491:int;
      
      private var var_2490:Boolean;
      
      private var var_1792:int;
      
      private var var_2488:Boolean;
      
      private var var_1384:Array;
      
      private var var_1417:Array;
      
      private var var_2495:int;
      
      private var var_1416:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1145:Boolean;
      
      private var var_2487:int;
      
      private var var_2494:Boolean;
      
      private var var_2497:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1384 = new Array();
         this.var_1417 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_265 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_265 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_938 = null;
         this.var_265 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_938 = param1.publicSpace;
            this.var_624 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_624 != null)
         {
            this.var_624.dispose();
            this.var_624 = null;
         }
         if(this.var_938 != null)
         {
            this.var_938.dispose();
            this.var_938 = null;
         }
         if(this.var_265 != null)
         {
            this.var_265.dispose();
            this.var_265 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_265 != null)
         {
            this.var_265.dispose();
         }
         this.var_265 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_624 != null)
         {
            this.var_624.dispose();
         }
         this.var_624 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_204 != null && this.var_204 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1145 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1145 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_204 = param1;
         this.var_1145 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_204 == null)
         {
            return;
         }
         this.var_204.dispose();
         this.var_204 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_204 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_204 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_204 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_624;
      }
      
      public function get avatarId() : int
      {
         return this.var_2119;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2489;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2493;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_265;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_938;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2496;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2491;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1792;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2490;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2487;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2492;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2488;
      }
      
      public function get adIndex() : int
      {
         return this.var_2497;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2494;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2119 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2491 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2496 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2489 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2493 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2490 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1792 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2487 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2492 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2488 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2497 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2494 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1384 = param1;
         this.var_1417 = new Array();
         for each(_loc2_ in this.var_1384)
         {
            if(_loc2_.visible)
            {
               this.var_1417.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1384;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1417;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2495 = param1.limit;
         this.var_1416 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1416 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_265.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_265 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_265.flatId;
         return this.var_1792 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1416 >= this.var_2495;
      }
      
      public function startLoading() : void
      {
         this.var_1145 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1145;
      }
   }
}
