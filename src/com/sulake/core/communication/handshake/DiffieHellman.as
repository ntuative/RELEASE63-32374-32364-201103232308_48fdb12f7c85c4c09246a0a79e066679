package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_958:BigInteger;
      
      private var var_2755:BigInteger;
      
      private var var_1993:BigInteger;
      
      private var var_2774:BigInteger;
      
      private var var_1539:BigInteger;
      
      private var var_1994:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1539 = param1;
         this.var_1994 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1539.toString() + ",generator: " + this.var_1994.toString() + ",secret: " + param1);
         this.var_958 = new BigInteger();
         this.var_958.fromRadix(param1,param2);
         this.var_2755 = this.var_1994.modPow(this.var_958,this.var_1539);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1993 = new BigInteger();
         this.var_1993.fromRadix(param1,param2);
         this.var_2774 = this.var_1993.modPow(this.var_958,this.var_1539);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2755.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2774.toRadix(param1);
      }
   }
}
