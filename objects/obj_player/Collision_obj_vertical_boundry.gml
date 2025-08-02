/// @description
if((other.bbox_left < bbox_left) || (other.bbox_right > bbox_right)) {
    var d = 360 - direction + 180;
    direction = d;
    _circle = false;
}

