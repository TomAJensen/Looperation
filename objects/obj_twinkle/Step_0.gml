if(_delay > 0) {
    _delay -= 1;
    return
} 

if(_delay = 0) {
    _delay -= 1;
    visible=true;
    image_speed = .5;
}

if(_delay == -1 && int64(image_index) >= image_number - 1) {
    if(_count <= 0) {
        instance_destroy(id)
        return;
    }
    image_index = 0
    _count--;
}

    
