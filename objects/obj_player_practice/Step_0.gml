/// @description 

if(!place_meeting(x, y, obj_star) && _collision_countdown == 0) {
    _in_collision = false;
}
_collision_countdown = max(0, _collision_countdown - 1)

var curr_direction = direction;
var field_placed = false;
if(_circle) {
    if(_place_fields) {
        field_placed =handle_fields();
    } 
    direction -= TURN;
} 

if(!field_placed) {
    utils_place_tracking_circle(x, y, curr_direction);
}


   