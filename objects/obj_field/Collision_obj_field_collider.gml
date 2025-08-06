/// @description 
//direction += 180;
if(_touched) {
    return;
}
direction = (direction + 180) % 360;
speed = 0;
_touched = true;
for(var i = 0; 1 <52; i++) {
    // i is the radius
    var xx = lengthdir_x(i, direction);
    var yy = lengthdir_y(i, direction);
    if(!place_meeting(xx, yy, obj_field_collider)) {
        break;
    }
    x += xx;
    y += yy;
}
