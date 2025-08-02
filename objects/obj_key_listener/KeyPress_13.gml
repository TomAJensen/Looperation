/// @description 
with(obj_sound_player) {
    kill_sound();
}
utils_kill_background_sound();
if(where_to != noone) {
    room_goto(where_to)
} else {
    room_goto_next();
}