/// @description 
image_alpha = min(image_alpha + alpha_speed, 1);
_gc_game_inst.image_alpha = image_alpha;
_gc_crafters_inst.image_alpha = image_alpha;
_gc_tm.image_alpha = image_alpha;

if(image_alpha == 1) {
    
    alarm[1] = game_get_speed(gamespeed_fps) * .5;
    return;
}
alarm[0] = alpha_delay;
