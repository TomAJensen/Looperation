/// @description 
event_inherited();
_FADE_IN_ALARM = 2;
_START_THE_POP = 1;

_inportal = false;  
image_index = 0;


image_alpha = 0;
alarm[_FADE_IN_ALARM] = 1;
_timed_idx = 0;
_popping = false;
_unpopping = false;
_inst_shadow = instance_find(obj_friend_shadow, 0)
_timed_positions = []; 
_inst_mover = noone;

_collider = instance_find(obj_field_collider, 0);
if(_collider == noone) {
    show_error("obj_field_collider missing", true);
}
_collider.x = x;
_collider.y = y;


if(timed) {
    var quad = 0;
    for(var i = 0; i < TIMED_POSITIONS_COUNT; i++ ) {
        var location = utils_place_friend_by_quadrant(quad + 1);
        var xx = location[_X_];
        var yy = location[_Y_]
        array_push(_timed_positions, [xx, yy]);
        quad =(quad + 1) % 4;
    }
}


check_collision = function () {
    var inst = instance_place(x, y, obj_mine_boundry);
    return inst;
}

reposition = function () {
    _cur_x = x;
    _cur_y = y;
    _collider.x = x;
    _collider.y = y;
}

_event_types = [MSG_PORTAL, MSG_SAVED, MSG_POP];

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
        case MSG_POP:
            _popping = true;
            return true;
    }
    return true;
}
