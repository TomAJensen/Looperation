/// @description 
event_inherited();

if(!place_meeting(x, y, _collided_friend_id)) {
    _collided_friend_id = false;
}

if(_circle) {
    if(_place_fields) {
        handle_fields();
    }
    direction -= TURN;
}
