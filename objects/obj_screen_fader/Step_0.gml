/// @description
event_inherited()
if(_inprogress) {
    _alpha = _fade_in ? max(_alpha - 0.02, 0) : min(1, _alpha + 0.02)
    if(!_fade_in && _alpha == 1) {
        msg_publish(msg_build_msg(MSG_FADE_STATE, inst_name, { "state": FADED_OUT}))
        _inprogress = false;
    } else if(_fade_in && _alpha = 0) {
        _inprogress = false;
    }
}
