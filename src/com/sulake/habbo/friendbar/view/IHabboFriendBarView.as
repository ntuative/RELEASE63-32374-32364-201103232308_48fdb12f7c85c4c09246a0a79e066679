package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.runtime.IUnknown;
   
   public interface IHabboFriendBarView extends IUnknown
   {
       
      
      function set visible(param1:Boolean) : void;
      
      function get visible() : Boolean;
   }
}
