/// @description 

if(!place_meeting(x, y, obj_friend)) {
    _in_collision = false;
}

if(_circle) {
    if(_place_fields) {
        handle_fields();
    }
    direction -= TURN;
}
