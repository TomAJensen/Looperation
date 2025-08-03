/// @description 
if(other._inportal) {
    return;
}
if(_collided_friend_id == other.id) {
    return;
}
_collided_friend_id = other.id;

//if(_in_collision) {
    //return;
//}
if(_circle) {
    _circle = false;
    speed = PLAYER_SPEED;
    utils_stop_sound(_splzzzt_sound_id);
}
//
//_in_collision = true;
instance_find(obj_friend_manager, 0).collided_friend();




