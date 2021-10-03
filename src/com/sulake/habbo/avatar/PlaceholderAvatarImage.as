package com.sulake.habbo.avatar
{
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.cache.AvatarImageCache;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import flash.display.BitmapData;
   
   public class PlaceholderAvatarImage extends AvatarImage
   {
      
      static var var_703:Map = new Map();
       
      
      public function PlaceholderAvatarImage(param1:AvatarStructure, param2:AssetAliasCollection, param3:AvatarFigureContainer, param4:String)
      {
         super(param1,param2,param3,param4);
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(!var_691)
         {
            _structure = null;
            _assets = null;
            var_278 = null;
            var_285 = null;
            var_621 = null;
            var_556 = null;
            var_332 = null;
            if(!var_1293 && var_46)
            {
               var_46.dispose();
            }
            var_46 = null;
            _loc1_ = getCache();
            if(_loc1_)
            {
               _loc1_.dispose();
               _loc1_ = null;
            }
            var_835 = null;
            var_691 = true;
         }
      }
      
      override protected function getFullImage(param1:String) : BitmapData
      {
         return var_703[param1];
      }
      
      override protected function cacheFullImage(param1:String, param2:BitmapData) : void
      {
         var_703[param1] = param2;
      }
      
      override public function appendAction(param1:String, ... rest) : Boolean
      {
         var _loc3_:* = null;
         if(rest != null && rest.length > 0)
         {
            _loc3_ = rest[0];
         }
         switch(param1)
         {
            case AvatarAction.const_415:
               switch(_loc3_)
               {
                  case AvatarAction.const_864:
                  case AvatarAction.const_570:
                  case AvatarAction.const_404:
                  case AvatarAction.const_740:
                  case AvatarAction.const_360:
                  case AvatarAction.const_649:
                     super.appendAction.apply(null,[param1].concat(rest));
               }
               break;
            case AvatarAction.const_294:
            case AvatarAction.const_643:
            case AvatarAction.const_243:
            case AvatarAction.const_850:
            case AvatarAction.const_686:
            case AvatarAction.const_867:
               super.addActionData.apply(null,[param1].concat(rest));
         }
         return true;
      }
      
      override public function isPlaceholder() : Boolean
      {
         return true;
      }
   }
}
