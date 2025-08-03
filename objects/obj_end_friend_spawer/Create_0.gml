//_total_friends = 50;
//_saved_friends = 35;
//_dead_friends = 15;
//_total_overall_score = 1207;
//_total_possible_score = 2500;

_total_friends = 0;
_saved_friends = 0;
_dead_friends = 0;
_total_overall_score = 0;
_total_possible_score = 0;


x = -100





instance_find(obj_horiz_boundry, 0).visible = false;
instance_find(obj_horiz_boundry, 1).visible = false;
instance_find(obj_horiz_boundry, 2).visible = false;
instance_find(obj_horiz_boundry, 3).visible = false;


var keys = struct_get_names(WORLD_SCORE_INFO)
for(var i = 0; i < array_length(keys); i++) {
    var key = keys[i];
    var info = WORLD_SCORE_INFO[$key];
    _total_friends += info[$"friends"];
    _saved_friends += info[$"saved"];
    _total_overall_score += info[$"score"];
}

_dead_friends = _total_friends - _saved_friends;

_total_possible_score = _total_friends * 50;

_percent = int64((_total_overall_score / _total_possible_score) * 100);

for(var i = 0; i < _saved_friends; i++) {
    instance_create_layer(irandom_range(25, room_width - 25), 608, "instances", obj_friend_celebrate);
}

for(var i = 0; i < _dead_friends; i++) {
    
    var instance = instance_create_layer(0, 0, "ghosts", obj_friend_drift, { "image_index": 1})
}

