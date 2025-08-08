event_inherited();
_cur_x = x;
_cur_y = y;
 x = -110;
_current_number = 0;


_event_types = [MSG_8_SEG]

_msg_handler = function(msg){
    _current_number = msg[$ "data"][$ "value"]
    return true;
}

_xpos = (_cur_x + (number_of_digits * sprite_width) / 2) - sprite_width;

