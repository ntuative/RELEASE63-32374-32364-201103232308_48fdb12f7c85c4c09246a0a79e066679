package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_92:IVector3d;
      
      protected var var_377:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_92 = param1;
         this.var_377 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_92;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_377;
      }
   }
}
