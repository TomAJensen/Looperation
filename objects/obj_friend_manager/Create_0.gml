/// @description 
event_inherited();
global.inst_friends_manager = id;
_friend_count = friends;

_saved = [];
_score = 0;
_score_possible = friends * SCORE_PER_FRIEND;
_hit_sound_id = -1;
_die_sound_id = -1;
_saved_sound_id = -1;

_friend_positions =[];

_shadow = instance_find(obj_friend_shadow,0);
_event_types = [MSG_SAVED, MSG_COLLIDED, MSG_DIED, MSG_NEXT_FRIEND, MSG_PORTAL]

_msg_handler = function(msg) {
    switch (msg[$"type"]) {
    	case MSG_COLLIDED: {
            collided_friend();
            break;
        }
        case MSG_SAVED: {
            saved_friend();
            break;
        }
        case MSG_DIED: {
            logdebug("MSG_DIED in obj_friend_manager");
            break;
        }
        case MSG_NEXT_FRIEND: {
            next_friend();
            break;
        }
        case MSG_PORTAL:{
            _saved_sound_id = audio_play_sound(snd_exit, 100, false);
            break;
        }
            
    }
    return true;
}

function reset(friend_count) {
    
}


function generate_friend_positions(count) {
    randomize();
    var position_array = []
    var quad = 0;
    
    for(var i = 0; i < count; i++) {
        var location = utils_place_friend_by_quadrant(quad + 1);
        var xx = location[_X_];
        var yy = location[_Y_]
        array_push(position_array, [xx, yy]);
        quad = (quad + 1) % 4;
    }
    
    return position_array;
}


function next_friend() {
    with(obj_friend) {
        array_push(other._saved, image_index)
        instance_destroy(id)
    }
    

    if(_friend_count == 0) {
        global.end_text = "You Were Victorious!";
        with(obj_sound_player) {
            kill_sound();
        }
        SCORE_INFO = {"saved": _saved, "score": _score, "friends": friends}
        OBJ_TRACKER = {};
        room_goto(rm_score);
        return;
    }
    _friend_count--
    var xx = _friend_positions[_friend_count][_X_];
    var yy = _friend_positions[_friend_count][_Y_];
    var friend = instance_create_layer(xx, yy, "Instances", obj_friend, { "timed": timed});
    utils_boundry_adjust(friend);
    if(_friend_count != 0) {
        // show next friend pos
        xx = _friend_positions[_friend_count-1][_X_];
        yy = _friend_positions[_friend_count-1][_Y_];
        _shadow.x = xx;
        _shadow.y = yy;
        utils_boundry_adjust(_shadow);
    }
    
    
}

function collided_friend() {
    var friend = instance_find(obj_friend, 0);
    friend.image_index++;
    friend.shake();
    if(friend.image_index == friend.image_number) {
        // he dead now.
        if(_hit_sound_id != -1) {
            audio_stop_sound(_hit_sound_id);
        }
        msg_publish(msg_build_msg(MSG_DIED, inst_name, { }))
        _die_sound_id = audio_play_sound(snd_friend_die, 110, false);
        instance_create_layer(friend.x, friend.y, "overlay", obj_friend_die);
        
        instance_destroy(friend);
        
        alarm[0] = 1;
        return;
    } 
    if(_hit_sound_id == -1) {
        _hit_sound_id = audio_play_sound(snd_friend_hit, 100, false);
    }
}

function saved_friend() {
    //_saved_sound_id = audio_play_sound(snd_exit, 100, false, 0.5);
    with(obj_friend) {
        array_push(other._saved, [id, image_index])
        var s = 50 - image_index * 10;    
        other._score += s;
        instance_destroy(id);
    }    
    var msg_data =  {}
    msg_data[$ SCORE_CURRENT] = _score;
    msg_data[$ SCORE_POSSIBLE] = _score_possible;
    msg_publish(msg_build_msg(MSG_SCORE, inst_name, msg_data))
    next_friend();
}

_friend_positions = generate_friend_positions(friends);


var msg = msg_build_msg(MSG_TOTAL_SMORGS, inst_name, friends)
msg_publish(msg);

if(auto_spawn) {
    next_friend();
}
