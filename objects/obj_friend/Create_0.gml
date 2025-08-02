/// @description 
event_inherited();
image_index = 0;
//_cur_x = x;
//_cur_y = y;
//_shake_index = 0;
//_shake_delay = game_get_speed(gamespeed_fps) * .02;
//
//
//_shake_vals = [
    //[-2, -2],
    //[2, 2],
    //[0, 0],
    //[-2, 2],
    //[2, -2],
    //[0, 0]
//]
//
//shake = function () {
    //_shake_index = 0;
    //alarm[0] = _shake_delay;
//}

image_alpha = 0;
alarm[2] = 1;

check_collision = function () {
    var inst = instance_place(x, y, obj_mine_boundry);
    return inst;
}

reposition = function () {
    _cur_x = x;
    _cur_y = y;
}
