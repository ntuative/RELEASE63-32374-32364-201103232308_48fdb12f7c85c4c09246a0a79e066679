package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1309:IHabboTracking;
      
      private var var_1361:Boolean = false;
      
      private var var_2600:int = 0;
      
      private var var_1859:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1309 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1309 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1361 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2600 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1361)
         {
            return;
         }
         ++this.var_1859;
         if(this.var_1859 <= this.var_2600)
         {
            this.var_1309.track("toolbar",param1);
         }
      }
   }
}
