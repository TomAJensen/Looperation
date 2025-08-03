/// @description 
var direction_changed = false;

if(other.bbox_top > bbox_top) {
    y -= bbox_bottom - other.bbox_top;
    direction_changed = true;
} else if (other.bbox_bottom < bbox_bottom) {
    y += other.bbox_bottom - bbox_top;
    direction_changed = true;
}
if(direction_changed == true) {
    var d = 360 - direction;
    direction = d;
    _circle = false;
    speed = PLAYER_SPEED;
    utils_stop_sound(_splzzzt_sound_id);    
} 