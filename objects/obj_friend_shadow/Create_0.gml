_max_alpha = .5;
_min_alpha = .3;

image_alpha = 0;

_alpha_adjust = .0035

check_collision = function () {
    var inst = instance_place(x, y, obj_mine_boundry);
    return inst;
}

reposition = function () {
    _cur_x = x;
    _cur_y = y;
}