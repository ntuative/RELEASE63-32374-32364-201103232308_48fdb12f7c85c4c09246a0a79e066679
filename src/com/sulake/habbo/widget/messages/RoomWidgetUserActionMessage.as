package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_671:String = "RWUAM_WHISPER_USER";
      
      public static const const_710:String = "RWUAM_IGNORE_USER";
      
      public static const const_680:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_588:String = "RWUAM_KICK_USER";
      
      public static const const_637:String = "RWUAM_BAN_USER";
      
      public static const const_728:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_705:String = "RWUAM_RESPECT_USER";
      
      public static const const_653:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_815:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_903:String = "RWUAM_START_TRADING";
      
      public static const const_898:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_491:String = "RWUAM_KICK_BOT";
      
      public static const const_725:String = "RWUAM_REPORT";
      
      public static const const_484:String = "RWUAM_PICKUP_PET";
      
      public static const const_1461:String = "RWUAM_TRAIN_PET";
      
      public static const const_461:String = " RWUAM_RESPECT_PET";
      
      public static const const_342:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_917:String = "RWUAM_START_NAME_CHANGE";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
