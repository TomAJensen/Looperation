/// @description 
var sound_id = ds_map_find_value( async_load,"sound_id")
if(sound_id == _hit_sound_id) {
    _hit_sound_id = -1;
}
if(sound_id == _die_sound_id) {
    _die_sound_id = -1;
}
if(sound_id == _saved_sound_id) {
    _saved_sound_id = -1;
}

