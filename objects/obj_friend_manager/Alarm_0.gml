/// @description Wait for die sound to end.
if(_die_sound_id != -1 || _hit_sound_id != -1 || _saved_sound_id != -1) {
    alarm[0] = 1;
    return;
}

next_friend();