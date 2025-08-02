/// @description 

if(_clear_fields_flag) {
    var inst = instance_find(obj_field, 0);
    if(inst == noone) {
        _clear_fields_flag = false;
        return;
    }
    instance_destroy(inst);
}

if(_collapsing) {
    var count = 0;
    with(obj_field) {
        count += !_touched ? 1 : 0;
    }
    if(count > 0) {
        return;
    }
    
    var friend = instance_find(_collapsing_object, 0)
    instance_create_layer(friend.x, friend.y, "Instances", obj_bang)
    if(destroy_with_bang) {
        instance_destroy(friend);
       
    }
     
    _collapsing = false;
    
}




