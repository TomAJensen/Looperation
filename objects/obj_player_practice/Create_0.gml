/// @description 
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
_collision_countdown = 0;
_shift_latch = false;
_response_index = 0;
_tracking_position_x = 0;
_tracking_position_y = 0;

alarm[FIRST_FRIEND] = game_get_speed(gamespeed_fps) * .5

function show_success() {
    with(obj_text_display) {
        if(inst_name == "bob_the_builder") {
            var key = $"practice_{other._response_index + 1}"
            timed_text(
                DISPLAY_TEXTS[$ key],
                game_get_speed(gamespeed_fps) * 3
            )
        }
    }
    
    _response_index = min(_response_index + 1, 6);
}

_splzzzt_sound_id = 0;

function handle_fields()
{
    var field_placed = false;
    var shift_down = keyboard_check(vk_shift) || _shift_latch;
    if(shift_down == false) {
        return false;
    }
    if(!_shift_latch) {
        _splzzzt_sound_id = utils_start_sound(snd_spltzzzzt, _splzzzt_sound_id);
    }
    _shift_latch = true;
    field_placed = true;
    if(_field_delay == 0 && shift_down == true) {
        
        instance_create_layer(x, y, "instances", obj_field, { "image_angle": direction})
        array_push(_points, [x,y,direction])
        _field_delay = FIELD_DEPLOY_DELAY;
    }
    _circle_count += TURN;
    if(_circle_count >= 360) {
        _circle = false;
        utils_stop_sound(_splzzzt_sound_id)
        var xy = utils_find_center(_points);

        var status = utils_is_friend_enclosed_in_circle(_points, obj_star)
        if(status[$"status"]) {
            status[$ "points"] = _points;
            array_push(_found, status);
            var field_manager = instance_find(obj_field_manager, 0);
            field_manager.collapse(obj_star);
            _shift_latch = false;
            audio_play_sound(snd_exit, 100, false, 0.5);
            show_success();
            alarm[NEXT_FRIEND] = 10;
        } else {
            alarm[CLEAR_FIELDS] = game_get_speed(gamespeed_fps) * .25;
        }
        _points = [];
        speed = PLAYER_SPEED;
    }
    _field_delay--;
    return field_placed
}




