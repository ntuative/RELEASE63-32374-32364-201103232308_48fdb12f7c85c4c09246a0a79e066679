package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_777;
         param1["bitmap"] = const_718;
         param1["border"] = const_836;
         param1["border_notify"] = const_1574;
         param1["button"] = const_548;
         param1["button_thick"] = const_641;
         param1["button_icon"] = const_1684;
         param1["button_group_left"] = const_910;
         param1["button_group_center"] = const_721;
         param1["button_group_right"] = const_771;
         param1["canvas"] = const_711;
         param1["checkbox"] = const_685;
         param1["closebutton"] = const_1205;
         param1["container"] = const_385;
         param1["container_button"] = const_845;
         param1["display_object_wrapper"] = const_765;
         param1["dropmenu"] = const_485;
         param1["dropmenu_item"] = const_532;
         param1["frame"] = const_392;
         param1["frame_notify"] = const_1719;
         param1["header"] = const_908;
         param1["html"] = const_1087;
         param1["icon"] = const_1162;
         param1["itemgrid"] = const_1183;
         param1["itemgrid_horizontal"] = const_479;
         param1["itemgrid_vertical"] = const_830;
         param1["itemlist"] = const_1180;
         param1["itemlist_horizontal"] = const_380;
         param1["itemlist_vertical"] = const_363;
         param1["label"] = WINDOW_TYPE_LABEL;
         param1["maximizebox"] = const_1515;
         param1["menu"] = const_1678;
         param1["menu_item"] = const_1699;
         param1["submenu"] = const_1139;
         param1["minimizebox"] = const_1548;
         param1["notify"] = const_1613;
         param1["null"] = const_894;
         param1["password"] = const_645;
         param1["radiobutton"] = const_700;
         param1["region"] = const_529;
         param1["restorebox"] = const_1487;
         param1["scaler"] = const_783;
         param1["scaler_horizontal"] = const_1569;
         param1["scaler_vertical"] = const_1555;
         param1["scrollbar_horizontal"] = const_463;
         param1["scrollbar_vertical"] = const_684;
         param1["scrollbar_slider_button_up"] = const_1068;
         param1["scrollbar_slider_button_down"] = const_1102;
         param1["scrollbar_slider_button_left"] = const_1207;
         param1["scrollbar_slider_button_right"] = const_1253;
         param1["scrollbar_slider_bar_horizontal"] = const_1135;
         param1["scrollbar_slider_bar_vertical"] = const_1171;
         param1["scrollbar_slider_track_horizontal"] = const_1014;
         param1["scrollbar_slider_track_vertical"] = const_1048;
         param1["scrollable_itemlist"] = const_1589;
         param1["scrollable_itemlist_vertical"] = const_474;
         param1["scrollable_itemlist_horizontal"] = const_1025;
         param1["selector"] = const_699;
         param1["selector_list"] = const_787;
         param1["submenu"] = const_1139;
         param1["tab_button"] = const_445;
         param1["tab_container_button"] = const_1153;
         param1["tab_context"] = const_579;
         param1["tab_content"] = const_1043;
         param1["tab_selector"] = const_873;
         param1["text"] = const_549;
         param1["input"] = const_654;
         param1["toolbar"] = const_1691;
         param1["tooltip"] = const_373;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
