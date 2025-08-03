/// @description 
//image_alpha = 0
_display_text = ""; 
_data_text = [];
if(string_starts_with(the_text, "#")) {
    _data_text = CONSOLE_TEXTS[$ the_text];    
} else if (string_length(the_text) != 0) {
    _data_text = [the_text];
} else {
    show_message("Empty text for console display")
}


_line_index = 0;
_line_delay = game_get_speed(gamespeed_fps) * 1.5;
_char_delay = 1;
_char_index = 0;
_current_line = "";
_cursor = "|"
_blink_speed = game_get_speed(gamespeed_fps) * 0.33;

alarm[3] = _blink_speed;

function next_line() {
    if(_line_index == array_length(_data_text)) {
        return false;
    }
    _char_index = 1;
    _current_line = _data_text[_line_index ++]
    if(_current_line == "") {
        _display_text += "\n"
        return next_line()
    }
    alarm[0] = _char_delay;
    return true;
}

alarm[1] = 1;
x = -100;

