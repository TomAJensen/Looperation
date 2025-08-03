/// @description Setup common code for items that shake when collided with.
event_inherited();
_cur_x = x;
_cur_y = y;
_shake_index = 0;
_shake_delay = game_get_speed(gamespeed_fps) * .02;


_shake_vals = [
    [-2, -2],
    [2, 2],
    [0, 0],
    [-2, 2],
    [2, -2],
    [0, 0]
]

shake = function () {
    _shake_index = 0;
    alarm[0] = _shake_delay;
}