/// @fileoverview Utility functions for mathematical calculations
/// @author Tom Jensen
/// @version 1.2.0

loginfo("Script: scp_messaging");



// a DS List gives more control than an []
global.message_queue = ds_list_create();
global.subscribers = ds_map_create();

/// @function msg_subscribe  
/// @description add subscriber
/// @param {string} _inst_name Name of the instance
/// @param {id.DsList} _local_queue Instances queue for messages
/// @return {Undefined} Description of what is returned
function msg_subscribe(_inst_name, _local_queue) {
    ds_map_add(global.subscribers,_inst_name,_local_queue);
    //logdebug($"Subscription: {_inst_name}")
    
}

/// @function msg_unsubscribe
/// @description remove subsription for _inst_name
/// @param {string} _inst_name the name of the instance to remove form subscribers
/// @return {undefined}
function msg_unsubscribe(_inst_name) {
    //logdebug($"Unsubscribing: {_inst_name}")
    // get the queue for the instance.
    var queue = ds_map_find_value(global.subscribers, _inst_name);
    // check that _inst_name was a valid key
    if(!is_undefined(queue)) {
        // clear any messages that are pending
        ds_list_clear(queue);
        // remove instance from subscribers.
        ds_map_delete(global.subscribers, _inst_name)
    } else {
        logdebug($"### {_inst_name} was not subcribed.")
    }
}


/// @description add _msg to the global queue
/// @param {struct} _msg message struct containing the message type and additional data:
///                 - msg_type: the type of message as string
///                 - data: struct or array containing specific data.
/// @return {Undefined}
function msg_publish(_msg) {
    // check for a messenger object
    if(instance_find(obj_messenger, 0) == noone) {
        show_error("Messenger missing.", true);
    }
    var watch_key = _msg[$"type"] + ":" + _msg[$"who"]
    if(array_contains(global.message_watch, watch_key)) {
        show_message($"Message Watch found {watch_key}");
    }
    ds_list_add(global.message_queue, _msg)
    //loginfo($"Publishing: {_msg}")
}

function msg_watch(type, who) {
    var key = type + ":" +who;
    array_push(global.message_watch, key);
}

function msg_unwatch(type, who) {
    var key = type + ":" +who;
    var index = array_get_index(global.message_watch, key);
    if(index > -1) {
        array_delete(global.message_watch, index, 1);
    }
}

/// @description distribute each message in the queue to all subscribers.
/// @return {Undefined}
function msg_distribute() {
    // get list of subscriber queues
    var _subs = ds_map_values_to_array(global.subscribers)
    
    var _subs_count = array_length(_subs);
    var _msg;
    var _subscribed_queue;
    
    // iterate of subscriber queue
    while (ds_list_size(global.message_queue) > 0) {
        // get the message to distribute.
         _msg = ds_list_find_value(global.message_queue, 0);

        //loginfo($"Distributing: {_msg}");
        // iterate the queues
        for(var i = 0; i < _subs_count; i++) {
            // get the local queue for the subscriber.
            _subscribed_queue = _subs[i];
            // add message to loval queue
            ds_list_add(_subscribed_queue, _msg);
            
        }
        
        ds_list_delete(global.message_queue, 0);
    }
}

/// @function msg_build_who_list
/// @description build the list of objects to listen too.
/// @param {string} _who comma delimited string of names 
/// @return {Array<String>} array of names
function msg_build_who_list(_who) {
    
    var _who_array = utils_split_and_trim(_who, ",");
    return _who_array;
}

/// @function msg_build_msg
/// @description build a message
/// @param {String} _msg_type the type of message
/// @param {String} _who what instance sent the message
/// @param {struct} _data additional info for the message
function msg_build_msg(_msg_type, _who, _data) {
    return {"type": _msg_type, "who": _who, "data": _data};
}

/// @function msg_process_incoming
/// @description handle processing the message.

function msg_process_incoming() {
    if(!is_subscriber) {
        return;
    }
    var _msg_count = ds_list_size(_message_queue);
    if(_msg_count < 1)
        return;
    
    var _un_handled_messages = [];
    
    for(var i = 0; i < _msg_count; i++) {
        // get the message
        var _msg = ds_list_find_value(_message_queue, i);
        if(is_undefined(_msg)) {
            continue;
        }
        //loginfo("Processing: " + string(_msg) + " for " + inst_name)
        // is it a publisher we are subscribed too or an empty _who_array. empty _whio_array will listen to all
        if(!array_length(_who_array) == 0 && 
            array_get_index(_who_array, "all") == -1 &&  
            array_get_index(_who_array, _msg[$ "who"]) == -1) {
            // ignore the message. it gets tossed
                //loginfo("Skipped: " + string(_msg) + " for " + inst_name);
                continue;
        }
        // is it a type supported?
        if(array_get_index(_event_types, _msg[$ "type"]) != -1) {
            // call handler, if the message is currently unhandled, preserve it.
            var result = _msg_handler(_msg);
            if(result == undefined) {
                show_message("_msg_handler returned undefined.")
                logdebug("_msg_handler undefined");
            }
            if(!result) {
                array_push(_un_handled_messages, _msg)
            }
        }
    }
    // clear the queue of messages
    ds_list_clear(_message_queue);
    // if there are presserved messages. save them.
    if(array_length(_un_handled_messages) > 0 ) {
        utils_spread_array(_message_queue, _un_handled_messages)
    }

}