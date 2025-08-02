/// @description
event_inherited();
_cur_x = x;
_cur_y = y;
_shake_index = 0;
_shake_delay = game_get_speed(gamespeed_fps) * .02;
_in_shake = false;
_collison_delay = 0;

_snark_index = 0;
_shake_vals = [
    [-2, -2],
    [2, 2],
    [0, 0],
    [-2, 2],
    [2, -2],
    [0, 0]
]



function shake() {
    _shake_index = 0;
    _in_shake = true
    alarm[0] = _shake_delay;
    with(obj_text_display) {
        if(inst_name == "wilbur") {
            var key = $"snarky_{other._snark_index + 1}"
            timed_text(
                DISPLAY_TEXTS[$ key],
                game_get_speed(gamespeed_fps) * 3
            )
        }
    }
    _snark_index++;
    _snark_index = _snark_index % 6; 
}

_event_types = [MSG_SAVED]

_msg_handler = function(msg) {
    var location = utils_place_friend();
    x = location[_X_];
    y = location[_Y_];
    _cur_x = x;
    _cur_y = y;
    return true;
}
