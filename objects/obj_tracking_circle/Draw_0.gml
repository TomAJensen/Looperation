draw_set_color(c_aqua)
var old_alpha = draw_get_alpha();
draw_set_alpha(.2);
var i = 0;
for(i = 0; i < array_length(_tracking_points) -1; i++) {
    //draw_point(_tracking_points[i][_X_] + x, _tracking_points[i][_Y_] + y);
    draw_line_width(_tracking_points[i][_X_] + x, _tracking_points[i][_Y_] + y, _tracking_points[i+1][_X_] + x, _tracking_points[i+1][_Y_] + y, 3);
}

draw_line_width(_tracking_points[i][_X_] + x, _tracking_points[i][_Y_] + y, _tracking_points[0][_X_] + x, _tracking_points[0][_Y_] + y, 3);
draw_set_alpha(old_alpha);



