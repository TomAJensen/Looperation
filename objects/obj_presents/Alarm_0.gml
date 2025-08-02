/// @description 
image_alpha = min(image_alpha + alpha_speed, 1);
if(image_alpha == 1) {
    alarm[1] = game_get_speed(gamespeed_fps) * 4;
    return;
}
alarm[0] = alpha_delay;
