package com.sulake.habbo.room.utils
{
   import com.sulake.core.utils.Map;
   
   public class RoomInstanceData
   {
       
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_732:TileHeightMap = null;
      
      private var var_1114:LegacyWallGeometry = null;
      
      private var var_1115:RoomCamera = null;
      
      private var var_733:SelectedRoomObjectData = null;
      
      private var var_731:SelectedRoomObjectData = null;
      
      private var _worldType:String = null;
      
      private var var_495:Map;
      
      private var var_496:Map;
      
      public function RoomInstanceData(param1:int, param2:int)
      {
         this.var_495 = new Map();
         this.var_496 = new Map();
         super();
         this._roomId = param1;
         this._roomCategory = param2;
         this.var_1114 = new LegacyWallGeometry();
         this.var_1115 = new RoomCamera();
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get tileHeightMap() : TileHeightMap
      {
         return this.var_732;
      }
      
      public function set tileHeightMap(param1:TileHeightMap) : void
      {
         if(this.var_732 != null)
         {
            this.var_732.dispose();
         }
         this.var_732 = param1;
      }
      
      public function get legacyGeometry() : LegacyWallGeometry
      {
         return this.var_1114;
      }
      
      public function get roomCamera() : RoomCamera
      {
         return this.var_1115;
      }
      
      public function get worldType() : String
      {
         return this._worldType;
      }
      
      public function set worldType(param1:String) : void
      {
         this._worldType = param1;
      }
      
      public function get selectedObject() : SelectedRoomObjectData
      {
         return this.var_733;
      }
      
      public function set selectedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_733 != null)
         {
            this.var_733.dispose();
         }
         this.var_733 = param1;
      }
      
      public function get placedObject() : SelectedRoomObjectData
      {
         return this.var_731;
      }
      
      public function set placedObject(param1:SelectedRoomObjectData) : void
      {
         if(this.var_731 != null)
         {
            this.var_731.dispose();
         }
         this.var_731 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_732 != null)
         {
            this.var_732.dispose();
            this.var_732 = null;
         }
         if(this.var_1114 != null)
         {
            this.var_1114.dispose();
            this.var_1114 = null;
         }
         if(this.var_1115 != null)
         {
            this.var_1115.dispose();
            this.var_1115 = null;
         }
         if(this.var_733 != null)
         {
            this.var_733.dispose();
            this.var_733 = null;
         }
         if(this.var_731 != null)
         {
            this.var_731.dispose();
            this.var_731 = null;
         }
         if(this.var_495 != null)
         {
            this.var_495.dispose();
            this.var_495 = null;
         }
         if(this.var_496 != null)
         {
            this.var_496.dispose();
            this.var_496 = null;
         }
      }
      
      public function addFurnitureData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_495.remove(param1.id);
            this.var_495.add(param1.id,param1);
         }
      }
      
      public function getFurnitureData() : FurnitureData
      {
         if(this.var_495.length > 0)
         {
            return this.getFurnitureDataWithId(this.var_495.getKey(0));
         }
         return null;
      }
      
      public function getFurnitureDataWithId(param1:int) : FurnitureData
      {
         return this.var_495.remove(param1);
      }
      
      public function addWallItemData(param1:FurnitureData) : void
      {
         if(param1 != null)
         {
            this.var_496.remove(param1.id);
            this.var_496.add(param1.id,param1);
         }
      }
      
      public function getWallItemData() : FurnitureData
      {
         if(this.var_496.length > 0)
         {
            return this.getWallItemDataWithId(this.var_496.getKey(0));
         }
         return null;
      }
      
      public function getWallItemDataWithId(param1:int) : FurnitureData
      {
         return this.var_496.remove(param1);
      }
   }
}
