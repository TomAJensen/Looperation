/// @description shake when struck

x = _cur_x + _shake_vals[_shake_index][0]
y = _cur_y + _shake_vals[_shake_index++][1]
if(_shake_index < array_length(_shake_vals)) {
    alarm[0] = _shake_delay;
}



