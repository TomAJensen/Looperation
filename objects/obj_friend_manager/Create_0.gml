/// @description 
global.inst_friends_manager = id;
_friend_count = friends;

_saved = [];
_score = 0;
_hit_sound_id = -1;
_die_sound_id = -1;
_saved_sound_id = -1;


function reset(friend_count) {
    
}

function next_friend() {
    with(obj_friend) {
        array_push(other._saved, image_index)
        instance_destroy(id)
    }
    
    var location = utils_place_friend();
    var xx = location[_X_];
    var yy = location[_Y_]
    if(_friend_count == 0) {
        global.end_text = "You Were Victorious!";
        with(obj_sound_player) {
            kill_sound();
        }
        SCORE_INFO = {"saved": array_length(_saved), "score": _score, "friends": friends}
        room_goto(rm_score);
        return;
    }
    // TODO: put back
    //xx = 227;
    //yy = 718;
    var friend = instance_create_layer(xx, yy, "Instances", obj_friend, { "timed": timed});
    utils_boundry_adjust(friend);
    //var boundry = friend.check_collision();
    //if(boundry != noone) {
        //var collision_info = utils_get_collision_dir(boundry, friend)
        //var side = collision_info[$"x"] != "" ? collision_info[$"x"] : collision_info[$"y"];
        //utils_un_collide(side, boundry, friend)
        //friend.reposition();
    //}
    
    _friend_count--
    
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
    _saved_sound_id = audio_play_sound(snd_exit, 100, false, 0.5);
    with(obj_friend) {
        array_push(other._saved, [id, image_index])
        var s = 50 - image_index * 10;    
        other._score += s;
    }    
}