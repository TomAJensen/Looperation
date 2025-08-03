/// @description if player collides, shake it baby.
shake();
var direction_info = utils_get_collision_dir(id, other.id);
var hspd_adjust = direction_info[$"x"] != "" ? -1 : 1;
var vspd_adjust = direction_info[$"y"] != "" ? -1 : 1;

other.hspeed = other.hspeed * hspd_adjust;
other.vspeed = other.vspeed * vspd_adjust;

if(hspd_adjust == -1) {
     utils_un_collide(direction_info[$"x"], id, other.id)   
}
if(vspd_adjust == -1) {
     utils_un_collide(direction_info[$"y"], id, other.id)   
}

if(other._circle) {
    other._circle = false;
    other.speed = PLAYER_SPEED;
    utils_stop_sound(other._splzzzt_sound_id);
}


