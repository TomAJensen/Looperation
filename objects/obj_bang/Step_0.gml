/// @description 
if(image_index + 1 >= image_number) {
    instance_destroy();
    msg_publish(msg_build_msg(MSG_SAVED, "bang", { }))
    
}