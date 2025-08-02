/// @description setup queue if subscriber
_message_queue = noone;
_event_types = [];

_cached_x = 0;
_cached_y = 0;
_who_array = [];
_msg_handler = function (_msg) {
    return true;
}



// is this instance s subscriber
if(is_subscriber) {
    // setup filter for messages
    _who_array = msg_build_who_list(who);
    _message_queue = ds_list_create();
    ds_list_clear(_message_queue);
    if(inst_name == "") {
        show_message($"Unnamed subscriber insance for type {object_get_name(object_index)} : {id}")
        return;
    } 
        
    msg_subscribe(inst_name, _message_queue)
    
}


