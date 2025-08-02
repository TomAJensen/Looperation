/// @description 
image_alpha = max(0, image_alpha - alpha_speed);
if(image_alpha == 0) {
    room_goto_next();
}
alarm[2] = alpha_delay;
