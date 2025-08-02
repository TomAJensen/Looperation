/// @description 
if(_in_collision) {
    return;
}
if(_circle) {
    _circle = false;
    speed = PLAYER_SPEED;
}

_in_collision = true;
instance_find(obj_friend_manager, 0).collided_friend();




