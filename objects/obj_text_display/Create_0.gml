/// @description 
//image_alpha = 0
_display_text = "";
_xx = x;
_yy = y;
_show_text = show_text;

x = -100;

if(string_starts_with(the_text, "#")) {
    _display_text = DISPLAY_TEXTS[$ the_text];
} else {
    _display_text = the_text;
}
    

function set_text(str_text) {
    _display_text = str_text;
}

function timed_text(str_text, delay) {
    alarm[0] = delay;
    _display_text = str_text;
    _show_text = true;
}