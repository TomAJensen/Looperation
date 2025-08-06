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
msg_publish(msg_build_msg(MSG_COLLIDED, inst_name, {}));




