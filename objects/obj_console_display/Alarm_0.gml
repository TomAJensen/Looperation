/// @description 
var text_len = string_length(_current_line)
if(_char_index > text_len) {
    _display_text = string_concat(_display_text, "\n\r");
    alarm[1] = _line_delay;
    return;
}
_display_text += string_char_at(_current_line, _char_index++);
audio_play_sound(snd_display_output, 10, false, .1, 0, 7);
alarm[0] = 3;