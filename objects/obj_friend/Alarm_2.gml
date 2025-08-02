image_alpha += .08;
if(image_alpha >= 1) {
    image_alpha = 1;
    if(timed == true) {
        alarm[1] = game_get_speed(gamespeed_fps) * 4;
    }
    return;
}

alarm[2] = 1;