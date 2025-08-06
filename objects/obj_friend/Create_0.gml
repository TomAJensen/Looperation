/// @description 
event_inherited();
_FADE_IN_ALARM = 2;
_START_THE_POP = 1;

_inportal = false;  
image_index = 0;


image_alpha = 0;
alarm[_FADE_IN_ALARM] = 1;

_inst_shadow = OBJ_TRACKER[$"shadow:"];


if(timed) {
    _inst_timed_shadow = OBJ_TRACKER[$"shadow:timed"]  
}
_popping = false;
_unpopping = false;
_timed_idx = 0;
_timed_positions = []; 
_inst_mover = noone;

_collider = instance_find(obj_field_collider, 0);
if(_collider == noone) {
    show_error("obj_field_collider missing", true);
}
_collider.x = x;
_collider.y = y;

randomize();
if(timed) {
    var quad = irandom(3);
    for(var i = 0; i < TIMED_POSITIONS_COUNT; i++ ) {
        var location = utils_place_friend_by_quadrant(quad + 1);
        var xx = location[_X_];
        var yy = location[_Y_]
        array_push(_timed_positions, [xx, yy]);
        var last_quad = quad;
        
        // choose any quad but the current one.
        while(last_quad == quad) {
            quad = irandom(3);
        }
    }
    _inst_timed_shadow.x = _timed_positions[_timed_idx][_X_];
    _inst_timed_shadow.y = _timed_positions[_timed_idx][_Y_];
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

place_timed_shadow = function() {
    
}
