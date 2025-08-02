/// @description 

if(!place_meeting(x, y, obj_star) && _collision_countdown == 0) {
    _in_collision = false;
}
_collision_countdown = max(0, _collision_countdown - 1)

if(_circle) {
    if(_place_fields) {
        handle_fields();
    }
    direction -= TURN;
}
