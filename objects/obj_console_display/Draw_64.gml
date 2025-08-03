/// @description
draw_set_font(fnt_console_normal);
draw_set_color(the_color);
var h = string_height("ABC|") + 8;
var text = $"{_display_text}{_cursor}";
draw_text_ext(start_x, start_y, text, h, room_width / 2); 


