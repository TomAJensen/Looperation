/// @description Wait for all the energy fields to be destroyed

// any fields?
if(instance_find(obj_field, 0)) {
    // yep, chack again
    alarm[ALARM_NEXT_FRIEND_1] = 5
    return;
}


//instance_find(obj_friend_manager, 0).next_friend();
msg_publish(msg_build_msg(MSG_NEXT_FRIEND, inst_name, {}))

