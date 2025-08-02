/// @description 
if(_in_collision || _collision_countdown > 0) {
    return;
}
if(_circle) {
    _circle = false;
    speed = PLAYER_SPEED;
}

_in_collision = true;
audio_play_sound(snd_friend_hit, 110, false);
_collision_countdown = game_get_speed(gamespeed_fps)





