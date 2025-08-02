/// @description 
alarm[0] = game_get_speed(gamespeed_fps);
_sound_id = 0;

function kill_sound() {
    audio_stop_sound(_sound_id)
}
