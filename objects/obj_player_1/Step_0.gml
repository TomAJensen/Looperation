/// @description 
event_inherited();
var field_placed = false;
var current_direction = direction;
if(!place_meeting(x, y, _collided_friend_id)) {
    _collided_friend_id = false;
}

if(_circle) {
    if(_place_fields) {
        field_placed = handle_fields();
    }
    direction -= TURN;
}

if(!field_placed) {
    utils_place_tracking_circle(x, y, current_direction);
}
