package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_533:RoomObjectLocationCacheItem = null;
      
      private var var_212:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         this.var_533 = new RoomObjectLocationCacheItem(param1);
         this.var_212 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return this.var_533;
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return this.var_212;
      }
      
      public function dispose() : void
      {
         if(this.var_533 != null)
         {
            this.var_533.dispose();
            this.var_533 = null;
         }
         if(this.var_212 != null)
         {
            this.var_212.dispose();
            this.var_212 = null;
         }
      }
   }
}
