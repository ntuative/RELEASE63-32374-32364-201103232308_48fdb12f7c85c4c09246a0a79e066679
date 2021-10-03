package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var _id:int;
      
      private var var_401:int;
      
      private var _type:String;
      
      private var var_1904:String;
      
      private var var_1903:int;
      
      private var var_1902:String;
      
      private var var_792:String;
      
      private var var_1901:String;
      
      private var var_2365:String;
      
      private var var_2661:uint;
      
      private var var_2505:uint;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this.var_401 = param1.readInteger();
         this._type = param1.readString();
         this.var_1904 = param1.readString();
         this.var_1903 = param1.readInteger();
         this.var_1902 = param1.readString();
         this.var_792 = param1.readString();
         this.var_2365 = param1.readString();
         this.var_2505 = param1.readInteger();
         var _loc2_:String = "";
         var _loc3_:int = this.var_792.length - 1;
         while(_loc3_ > 0 && this.isNumber(this.var_792.charAt(_loc3_)))
         {
            _loc2_ = this.var_792.charAt(_loc3_) + _loc2_;
            _loc3_--;
         }
         if(_loc3_ > 0)
         {
            this.var_1901 = this.var_792.substring(0,_loc3_ + 1);
         }
         else
         {
            this.var_1901 = this.var_792;
         }
         this.var_2661 = uint(_loc2_);
      }
      
      private function getNumber(param1:String) : int
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ - 48;
      }
      
      private function isNumber(param1:String) : Boolean
      {
         var _loc2_:int = param1.charCodeAt(0);
         return _loc2_ >= 48 && _loc2_ <= 57;
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this.var_401 = 0;
         this._type = "";
         this.var_1904 = "";
         this.var_1903 = 0;
         this.var_1902 = "";
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get status() : int
      {
         return this.var_401;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get roomItemTypeName() : String
      {
         return this.var_1904;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1903;
      }
      
      public function get endDateTimeStamp() : String
      {
         return this.var_1902;
      }
      
      public function get localizationCode() : String
      {
         return this.var_792;
      }
      
      public function get sortCode() : uint
      {
         return this.var_2661;
      }
      
      public function get sortOrder() : uint
      {
         return this.var_2505;
      }
      
      public function get localizationPrefix() : String
      {
         return this.var_1901;
      }
      
      public function get questBadgeAchievementTypeId() : String
      {
         return this.var_2365;
      }
   }
}
