/// @description
if(!_show_text) {
    return;
}

draw_set_font(the_font);
draw_set_color(the_color);

var height = string_height("ABC") + 10;
var width = string_width(_display_text)
var xx = _xx - width / 2

draw_text_ext(xx, _yy, _display_text, height + 5, room_width - 10 - xx); 



