/// @description 
event_inherited();
direction = 0;
speed = PLAYER_SPEED;

_field_delay = 0;
_circle_radius = 100;
_direction_holder = 0;
_in_collision = false;

_circle_x = x;
_circle_y = y + _circle_radius;
//obj_tracker.x = _circle_x;
//obj_tracker.y = _circle_y;
_circle = false;
_circle_count = 0;
_field_persist = -1;
_place_fields = false;
_points = []
_found = [];
_shift_latch = false;
alarm[ALARM_FIRST_FRIEND_0] = game_get_speed(gamespeed_fps) * .5
_event_types = [MSG_NEXT_FRIEND];
_splzzzt_sound_id = 0;

_collided_friend_id = noone;
_circle_completed = false;


_msg_handler = function(msg) {
     //var inst = instance_find(obj_friend_manager, 0);
    //inst.next_friend();
    return true;
}

function handle_fields()
{   
    var field_placed = false;
    var shift_down = keyboard_check(vk_shift) || _shift_latch;
    if(!_shift_latch) {
        _splzzzt_sound_id = utils_start_sound(snd_spltzzzzt, _splzzzt_sound_id);
    }    
    if(shift_down == false) {
        return field_placed;
    }
    field_placed = true;
    _shift_latch = true;
    if(_field_delay == 0) {
        instance_create_layer(x, y, "instances", obj_field, { "image_angle": direction})
        array_push(_points, [x,y,direction])
        _field_delay = FIELD_DEPLOY_DELAY;
    }
    _circle_count += TURN;
    if(_circle_count >= 360) {
        _circle_completed = true;
        _circle = false;
        utils_stop_sound(_splzzzt_sound_id)
        var status = utils_is_friend_enclosed_in_circle(_points)
        if(status[$"status"]) {
            status[$ "points"] = _points;
            array_push(_found, status);
            var field_manager = instance_find(obj_field_manager, 0);
            field_manager.collapse();
            _shift_latch = false;
            //var friend_manager = instance_find(obj_friend_manager, 0);
            //friend_manager.saved_friend();
            //msg_publish(msg_build_msg(MSG_SAVED, inst_name, {}));
        } else {
            //alarm[CLEAR_FIELDS] = game_get_speed(gamespeed_fps) * .25;
        }
        _points = [];
        speed = PLAYER_SPEED;
    }
    _field_delay--;
    return field_placed;
    
}

