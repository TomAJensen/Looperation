/// @description 
event_inherited();
_inportal = false;    
image_index = 0;


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

_event_types = [MSG_PORTAL, MSG_SAVED]

_msg_handler = function(msg) {
    switch(msg[$"type"]) {
        case MSG_PORTAL:
            _inportal = true;
            image_alpha = 1;
            return true;
        case MSG_SAVED:
            alarm[3] = FPS * .5;
            x = -100;
            return true;
    }
    return true;
}
