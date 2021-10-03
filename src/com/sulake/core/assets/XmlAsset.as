package com.sulake.core.assets
{
   import flash.utils.ByteArray;
   
   public class XmlAsset implements IAsset
   {
       
      
      private var _disposed:Boolean = false;
      
      private var var_189:XML;
      
      private var var_1650:AssetTypeDeclaration;
      
      private var var_1047:String;
      
      public function XmlAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         this.var_1650 = param1;
         this.var_1047 = param2;
      }
      
      public function get url() : String
      {
         return this.var_1047;
      }
      
      public function get content() : Object
      {
         return this.var_189 as Object;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return this.var_1650;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_189 = null;
            this.var_1650 = null;
            this.var_1047 = null;
         }
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         var _loc2_:* = null;
         if(param1 is Class)
         {
            _loc2_ = new param1() as ByteArray;
            this.var_189 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is ByteArray)
         {
            _loc2_ = param1 as ByteArray;
            this.var_189 = new XML(_loc2_.readUTFBytes(_loc2_.length));
            return;
         }
         if(param1 is String)
         {
            this.var_189 = new XML(param1 as String);
            return;
         }
         if(param1 is XML)
         {
            this.var_189 = param1 as XML;
            return;
         }
         if(param1 is XmlAsset)
         {
            this.var_189 = XmlAsset(param1).var_189;
            return;
         }
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is XmlAsset)
         {
            this.var_189 = XmlAsset(param1).var_189;
            return;
         }
         throw Error("Provided asset is not of type XmlAsset!");
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
   }
}
