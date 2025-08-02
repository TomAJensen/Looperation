/// @description 
if(_circle == true) {
    direction += 90 / _circle_radius * speed;  // Adjust rotation based on speed
    x = _circle_x + lengthdir_x(_circle_radius, direction + 90);
    y = _circle_y + lengthdir_y(_circle_radius, direction + 90);
}

show_debug_message($"Direction: {direction}");
