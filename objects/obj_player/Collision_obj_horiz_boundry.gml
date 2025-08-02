/// @description 
if((other.bbox_top > bbox_top) || (other.bbox_bottom < bbox_bottom)) {
    // hit top edge
    var d = 360 - direction;
    direction = d;
    _circle = false;
    
} 