/// @description 
if(!_in_shake && _collison_delay == 0) {
    shake();
    _collison_delay = game_get_speed(gamespeed_fps);
}