if(_shrinking) {
    return;
}

if(int64(image_index) == image_number -1) {
    // ready to pop
    msg_publish(msg_build_msg(MSG_POP, "timed_we_move", { }));
    image_speed = 0;
    _shrinking = true;
}
