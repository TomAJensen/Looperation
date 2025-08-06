event_inherited();
if(_inportal) {
    image_angle += 10;
    image_xscale = max(0, image_xscale - .02);
    image_yscale = max(0, image_yscale - .02);
    return;
}

if(_popping) {
    image_xscale = max(0, image_xscale - .15);
    image_yscale = image_xscale;
    
    _inst_mover.image_xscale = image_xscale;
    _inst_mover.image_yscale = image_xscale;
    
    if(image_xscale == 0) {
        instance_destroy(_inst_mover);
        x = _timed_positions[_timed_idx][_X_];
        y = _timed_positions[_timed_idx][_Y_];
        reposition();
        //image_xscale = 1;
        //image_yscale = 1;
        _timed_idx = (_timed_idx + 1) % TIMED_POSITIONS_COUNT;
        _popping = false;
        alarm[4] = FPS * .25;
        audio_play_sound(snd_smerg_move, 100, false);
        
    }
     return;   
}

if(_unpopping) {
    image_xscale = min(image_xscale + .3, 1);
    image_yscale = image_xscale;
    if(image_xscale == 1) {
        _unpopping = false;
        alarm[_START_THE_POP] = game_get_speed(gamespeed_fps) * 6;
    }
}


