var text = $"Total Fellow Smorgs saved {_saved_friends} out of {_total_friends}\n" +
$"Total score {_total_overall_score} out of {_total_possible_score} possible.\n" +
$"Your rating is {_percent}%\n\n" +
"Press ESCAPE to exit.\n" +
"Press ENTER to return to the title screen";
var width = string_width(text);
var height = ((string_height("T_") + 5) * 6) + 40;
draw_set_color(c_black);
var old_alpha = draw_get_alpha();
draw_set_alpha(.60);
draw_rectangle(0, 0, width + 40, height, false);
draw_set_alpha(old_alpha);
draw_set_color(#cc9966);
draw_set_font(fnt_console_large);
draw_text_ext(20, 20, text, string_height("T_") + 5, room_width);






