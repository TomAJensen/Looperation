/// @description Fade in
image_alpha += .08;
if(image_alpha >= 1) {
    image_alpha = 1;
    if(timed == true) {
        alarm[_START_THE_POP] = game_get_speed(gamespeed_fps) * 6;
    }
    return;
}

alarm[2] = 1;