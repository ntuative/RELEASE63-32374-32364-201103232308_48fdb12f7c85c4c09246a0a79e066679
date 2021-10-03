package com.sulake.habbo.quest
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   import flash.events.Event;
   
   public class QuestCompleted implements IDisposable
   {
       
      
      private var var_63:QuestCampaign;
      
      private var var_191:IFrameWindow;
      
      private var var_691:Boolean = false;
      
      private const const_1953:String = "achievement_bg_001";
      
      public function QuestCompleted(param1:QuestCampaign, param2:QuestMessageData)
      {
         super();
         this.var_63 = param1;
         this.localize(param2);
      }
      
      public function dispose() : void
      {
         if(this.var_191)
         {
            this.var_191.dispose();
            this.var_191 = null;
         }
         this.var_691 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_691;
      }
      
      private function onOpenCatalog(param1:Event, param2:IWindow = null) : void
      {
         this.dispose();
         this.var_63.closeQuestCompleted(this);
         var _loc3_:String = "catalog.page.quest." + this.var_63.code;
         Logger.log("Questing->Open Catalog: " + _loc3_);
         this.var_63.controller.questEngine.openCatalog(_loc3_);
         this.var_63.controller.onQuestCompletedDialogClose();
      }
      
      private function onCompletedDialogClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            this.dispose();
            this.var_63.closeQuestCompleted(this);
            this.var_63.controller.onQuestCompletedDialogClose();
         }
      }
      
      private function localize(param1:QuestMessageData) : void
      {
         this.var_191 = IFrameWindow(this.var_63.controller.questEngine.getXmlWindow("QuestCompletedDialog"));
         this.var_191.findChildByTag("close").procedure = this.onCompletedDialogClose;
         var _loc2_:IWindow = this.var_191.findChildByName("close_button");
         _loc2_.procedure = this.onCompletedDialogClose;
         var _loc3_:String = "quest_" + this.var_63.code;
         var _loc4_:String = _loc3_ + "_" + param1.localizationCode;
         var _loc5_:* = _loc4_ + ".completed.desc";
         this.var_63.controller.questEngine.localization.registerParameter(_loc5_,"amount",param1.rewardCurrencyAmount.toString());
         this.var_191.findChildByName("description_txt").caption = this.var_63.controller.questEngine.localization.getKey(_loc5_);
         var _loc6_:* = _loc3_ + ".completed.currency";
         this.var_63.controller.questEngine.localization.registerParameter(_loc6_,"amount",param1.rewardCurrencyAmount.toString());
         this.var_191.findChildByName("reward_txt").caption = this.var_63.controller.questEngine.localization.getKey(_loc6_);
         var _loc7_:IWindow = this.var_191.findChildByName("reward_info_txt");
         _loc7_.caption = this.var_63.controller.questEngine.localization.getKey(_loc3_ + ".completed.reward");
         _loc7_.mouseThreshold = 0;
         _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onRewardInfo);
         var _loc8_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_191.findChildByName("quest.reward.icon"));
         var _loc9_:String = "icon_" + this.var_63.code + "_reward_" + param1.rewardCurrencyAmount;
         this.var_63.controller.questEngine.setImageFromAsset(_loc8_,_loc9_,this.onRewardImageReady);
         var _loc10_:IBitmapWrapperWindow = IBitmapWrapperWindow(this.var_191.findChildByName("background_image"));
         this.var_63.controller.questEngine.setImageFromAsset(_loc10_,"QuestCompletedBackground",this.onBackgroundImageReady);
         this.var_191.center();
      }
      
      private function onRewardImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this.var_691 && this.var_191 && _loc2_)
         {
            _loc3_ = IBitmapWrapperWindow(this.var_191.findChildByName("quest.reward.icon"));
            this.var_63.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onRewardImageReady);
         }
      }
      
      private function onBackgroundImageReady(param1:AssetLoaderEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:AssetLoaderStruct = param1.target as AssetLoaderStruct;
         if(!this.var_691 && this.var_191 && _loc2_)
         {
            _loc3_ = IBitmapWrapperWindow(this.var_191.findChildByName("background_image"));
            this.var_63.controller.questEngine.setImageFromAsset(_loc3_,_loc2_.assetName,this.onRewardImageReady);
         }
      }
      
      public function onRewardInfo(param1:Event, param2:IWindow = null) : void
      {
         var _loc3_:* = null;
         if(this.var_63)
         {
            _loc3_ = "catalog.page.quest." + this.var_63.code;
            Logger.log("Questing->Open Catalog: " + _loc3_);
            this.var_63.controller.questEngine.openCatalog(_loc3_);
         }
         param1.stopPropagation();
         param1.stopImmediatePropagation();
      }
   }
}
