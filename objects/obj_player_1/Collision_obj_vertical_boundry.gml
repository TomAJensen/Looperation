/// @description
var direction_changed = false;
if(other.bbox_left < bbox_left) {
    x += other.bbox_right - bbox_left;
    direction_changed = true;
} else if(other.bbox_right > bbox_right) {
    x -= bbox_right - other.bbox_left;
    direction_changed = true;
}
if(direction_changed == true) {
    var d = 360 - direction + 180;
    direction = d;
    _circle = false;
    speed = PLAYER_SPEED;
    utils_stop_sound(_splzzzt_sound_id);
}

