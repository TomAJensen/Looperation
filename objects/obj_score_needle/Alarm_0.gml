/// @description update needle
if(_score_current < _score_new) {
    _score_current++;
    var percent_of_possble = _score_current / _score_possible;
    var needle_position = 180 * percent_of_possble;
    image_angle = -needle_position;
    msg_publish(msg_build_msg(MSG_8_SEG, inst_name, { "value": _score_current}))
}
alarm[0] = _score_delay;