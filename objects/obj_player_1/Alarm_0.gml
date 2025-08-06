/// @description FIRST_FRIEND deploy first smorg


//var friend_manager = instance_find(obj_friend_manager, 0);
//if(friend_manager != noone){
    //friend_manager.next_friend();    
//}
msg_publish(msg_build_msg(MSG_NEXT_FRIEND, inst_name, {}))
