if(image_alpha <= 0) {
    image_alpha = 0;
    var location = utils_place_friend();
    x = location[_X_];
    y = location[_Y_];
    utils_boundry_adjust(id)
    
    alarm[2] = 1;
    return;
}
alarm[1] = game_get_speed(gamespeed_fps) / 10;
image_alpha -= .08;
