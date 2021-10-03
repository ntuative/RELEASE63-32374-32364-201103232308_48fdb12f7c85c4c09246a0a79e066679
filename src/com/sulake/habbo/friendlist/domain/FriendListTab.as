package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.friendlist.HabboFriendList;
   import com.sulake.habbo.friendlist.ITabView;
   
   public class FriendListTab
   {
      
      public static const const_95:int = 1;
      
      public static const const_94:int = 2;
      
      public static const const_374:int = 3;
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var _footerName:String;
      
      private var var_2110:String;
      
      private var var_1584:ITabView;
      
      private var var_1325:Boolean;
      
      private var _selected:Boolean;
      
      private var var_16:IWindowContainer;
      
      public function FriendListTab(param1:HabboFriendList, param2:int, param3:ITabView, param4:String, param5:String, param6:String)
      {
         super();
         this._id = param2;
         this._name = param4;
         this.var_1584 = param3;
         this._footerName = param5;
         this.var_2110 = param6;
         this.var_1584.init(param1);
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_1325 = false;
         }
         this._selected = param1;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(this.selected)
         {
            this.var_1325 = false;
         }
         else
         {
            this.var_1325 = param1;
         }
      }
      
      public function get newMessageArrived() : Boolean
      {
         return this.var_1325;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get footerName() : String
      {
         return this._footerName;
      }
      
      public function get headerPicName() : String
      {
         return this.var_2110;
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function get tabView() : ITabView
      {
         return this.var_1584;
      }
      
      public function get view() : IWindowContainer
      {
         return this.var_16;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this.var_16 = param1;
      }
   }
}
