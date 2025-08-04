draw_set_font(fnt_console_normal);
draw_set_color(the_color);
var display_text = "Please select your difficulty.\n\n";
for(var i = 0; i < array_length(_text_data); i ++) {
    var bracked_left = i == _cur_difficulty ? _pointer + "-": "  ";
    var bracked_right = i == _cur_difficulty ? "<" : " ";
    var snark = i == _cur_difficulty ? " (" + _snarks[i] + ")": ""
    display_text = display_text + bracked_left + _text_data[i] + snark + "\n";
}

draw_text_ext(_cur_x, _cur_y, display_text, string_height("ABCg") + 5, room_width);