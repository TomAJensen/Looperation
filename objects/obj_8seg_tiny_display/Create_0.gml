event_inherited();
_cur_x = x;
_cur_y = y;
 x = -110;
_current_number = start_value;
_digits = []



_event_types = [MSG_8_SEG]

_msg_handler = function(msg){
    _current_number = msg[$ "data"][$ "value"]
    return true;
}

_xpos = int64((_cur_x + (number_of_digits * sprite_width) / 2) - sprite_width);

//var xx = _xpos
//for(var i = 0; i < 4; i++) {
    //var inst = instance_create_layer(xx, y, "instances", obj_8seg_tiny_digit)   
    //xx -=  inst.sprite_width;
//}




