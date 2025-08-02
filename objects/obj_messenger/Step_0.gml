/// @description 
visible = false;
if(ds_list_size(global.message_queue) > 0 ){
    //logdebug("distributing messages");
    msg_distribute();
}