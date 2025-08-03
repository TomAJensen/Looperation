/// @description 
event_inherited();
image_alpha = 0;
alarm[0] = game_get_speed(gamespeed_fps);
_gc_game_inst = instance_find(obj_logo_game, 0);
_gc_crafters_inst =  instance_find(obj_logo_crafters, 0)
_gc_tm = instance_find(obj_logo_tm, 0);
_gc_game_inst.image_alpha = 0;
_gc_crafters_inst.image_alpha = 0;
_gc_tm.image_alpha = 0;
