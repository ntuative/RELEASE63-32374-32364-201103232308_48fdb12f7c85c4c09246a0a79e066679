package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_1964:int = 0;
      
      public static const const_1514:int = 1;
      
      public static const const_1659:int = 2;
      
      public static const const_1854:int = 3;
      
      public static const const_1973:int = 4;
      
      public static const const_1901:int = 5;
      
      public static const const_1524:int = 10;
      
      public static const const_1882:int = 11;
      
      public static const const_1992:int = 12;
      
      public static const const_1946:int = 13;
      
      public static const const_1974:int = 16;
      
      public static const const_1828:int = 17;
      
      public static const const_1832:int = 18;
      
      public static const const_2014:int = 19;
      
      public static const const_1931:int = 20;
      
      public static const const_1949:int = 22;
      
      public static const const_1947:int = 23;
      
      public static const include:int = 24;
      
      public static const const_1966:int = 25;
      
      public static const const_1863:int = 26;
      
      public static const const_1809:int = 27;
      
      public static const const_1799:int = 28;
      
      public static const const_1927:int = 29;
      
      public static const const_1913:int = 100;
      
      public static const const_1969:int = 101;
      
      public static const const_1813:int = 102;
      
      public static const const_1999:int = 103;
      
      public static const const_1880:int = 104;
      
      public static const const_2001:int = 105;
      
      public static const const_1976:int = 106;
      
      public static const const_1796:int = 107;
      
      public static const const_1957:int = 108;
      
      public static const const_1859:int = 109;
      
      public static const const_1860:int = 110;
      
      public static const const_1908:int = 111;
      
      public static const const_1907:int = 112;
      
      public static const const_2018:int = 113;
      
      public static const const_1831:int = 114;
      
      public static const const_1950:int = 115;
      
      public static const const_1988:int = 116;
      
      public static const const_1876:int = 117;
      
      public static const const_1825:int = 118;
      
      public static const const_1921:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1514:
            case const_1524:
               return "banned";
            case const_1659:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
