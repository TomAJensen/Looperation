/// @description 
event_inherited() 
x = -100;
if(start_faded_in) {
    _alpha = 0;
    _fade_in = false;
    _inprogress = false;
} else {
    _alpha = 1;
    _fade_in = true
    _inprogress = true;
}

_msg_handler = function(msg) {
    switch(msg[$"type"]) {
        case MSG_SCREEN_SWITCH: 
            _fade_in = false; 
            _inprogress = true;
            return true;
        case MSG_FADE_STATE:
            if(msg[$"data"][$"state"] == FADED_OUT) {
                alarm[0] = game_get_speed(gamespeed_fps) * 2;
            }
            return true;
    }
}

_event_types = [MSG_SCREEN_SWITCH, MSG_FADE_STATE];    