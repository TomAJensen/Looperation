/// @description 

_clear_fields_flag = false;
_collapsing = false;
_collapsing_object = noone;

function clear_fields() {
    if(_clear_fields_flag == false) {
        _clear_fields_flag = true;
    }
}

function can_place_fields() {
    var inst = instance_find(obj_field, 0);
    return inst = noone;
}

function collapse(obj = obj_friend) {
    _collapsing_object = obj;
    var friend = instance_find(obj, 0);
    var max_dist = 0;
    with(obj_field) {
        var dist = point_distance(x,y,friend.x, friend.y);
        max_dist = max(max_dist, dist);
    }
    
    with(obj_field) {
        var dist = point_distance(x,y,friend.x, friend.y)
        direction = point_direction(x,y,friend.x, friend.y);
        var _speed = dist / max_dist;
        speed = _speed * 10;
    }
    _collapsing = true;
}
