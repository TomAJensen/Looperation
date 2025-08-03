FPS = game_get_speed(gamespeed_fps);
alarm[0] = random_range(FPS *.25, FPS * 2);
logdebug($"Time {alarm[0]}")
_gravity = 0.1;