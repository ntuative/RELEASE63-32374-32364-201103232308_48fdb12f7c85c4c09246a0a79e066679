package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_184;
         param1["bound_to_parent_rect"] = const_93;
         param1["child_window"] = const_1088;
         param1["embedded_controller"] = const_1175;
         param1["resize_to_accommodate_children"] = const_69;
         param1["input_event_processor"] = const_30;
         param1["internal_event_handling"] = const_730;
         param1["mouse_dragging_target"] = const_256;
         param1["mouse_dragging_trigger"] = const_381;
         param1["mouse_scaling_target"] = const_283;
         param1["mouse_scaling_trigger"] = const_481;
         param1["horizontal_mouse_scaling_trigger"] = const_273;
         param1["vertical_mouse_scaling_trigger"] = const_255;
         param1["observe_parent_input_events"] = const_1108;
         param1["optimize_region_to_layout_size"] = const_497;
         param1["parent_window"] = const_1054;
         param1["relative_horizontal_scale_center"] = const_191;
         param1["relative_horizontal_scale_fixed"] = const_150;
         param1["relative_horizontal_scale_move"] = const_365;
         param1["relative_horizontal_scale_strech"] = const_414;
         param1["relative_scale_center"] = const_1051;
         param1["relative_scale_fixed"] = const_764;
         param1["relative_scale_move"] = const_1131;
         param1["relative_scale_strech"] = const_1194;
         param1["relative_vertical_scale_center"] = const_189;
         param1["relative_vertical_scale_fixed"] = const_125;
         param1["relative_vertical_scale_move"] = const_266;
         param1["relative_vertical_scale_strech"] = const_324;
         param1["on_resize_align_left"] = const_751;
         param1["on_resize_align_right"] = const_550;
         param1["on_resize_align_center"] = const_467;
         param1["on_resize_align_top"] = const_766;
         param1["on_resize_align_bottom"] = const_568;
         param1["on_resize_align_middle"] = const_554;
         param1["on_accommodate_align_left"] = const_1186;
         param1["on_accommodate_align_right"] = const_432;
         param1["on_accommodate_align_center"] = const_789;
         param1["on_accommodate_align_top"] = const_1152;
         param1["on_accommodate_align_bottom"] = const_465;
         param1["on_accommodate_align_middle"] = const_911;
         param1["route_input_events_to_parent"] = const_596;
         param1["use_parent_graphic_context"] = const_33;
         param1["draggable_with_mouse"] = const_1239;
         param1["scalable_with_mouse"] = const_1022;
         param1["reflect_horizontal_resize_to_parent"] = const_498;
         param1["reflect_vertical_resize_to_parent"] = const_593;
         param1["reflect_resize_to_parent"] = const_285;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1254;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
