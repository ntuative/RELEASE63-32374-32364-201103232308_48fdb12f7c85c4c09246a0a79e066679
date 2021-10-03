package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1781:int;
      
      private var var_2461:int;
      
      private var var_741:int;
      
      private var var_552:Number;
      
      private var var_2463:Boolean;
      
      private var var_2462:int;
      
      private var var_1782:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2461 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2462 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2463 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_741;
         if(this.var_741 == 1)
         {
            this.var_552 = param1;
            this.var_1781 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_741);
            this.var_552 = this.var_552 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2463 && param3 - this.var_1781 >= this.var_2461 && this.var_1782 < this.var_2462)
         {
            _loc5_ = 1000 / this.var_552;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1782;
            this.var_1781 = param3;
            this.var_741 = 0;
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
