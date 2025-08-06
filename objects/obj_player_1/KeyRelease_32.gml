/// @description Insert description here
_circle = false;
speed = PLAYER_SPEED;
_shift_latch = false;
utils_stop_sound(_splzzzt_sound_id);
if(_circle_completed) {
    _circle_completed = false;
    return;
}
alarm[ALARM_CLEAR_FIELDS_11] =  game_get_speed(gamespeed_fps) * .25;

