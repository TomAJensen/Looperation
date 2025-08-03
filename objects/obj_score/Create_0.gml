ds_map_clear(global.subscribers);
ds_list_clear(global.message_queue);
_score = SCORE_INFO[$"score"]
_saved = SCORE_INFO[$"saved"]
_friends = SCORE_INFO[$"friends"]
_curx = x;
_cury = y;
 x = -100;


for(var i = 0; i < _saved; i++) {
    instance_create_layer(0,0,"drifters", obj_friend_drift)
}
for(var i = 0; i < _friends - _saved; i++) {
    instance_create_layer(0,0,"drifters", obj_friend_drift, { "image_index": 1, "image_alpha": .65})
}

var total_score = _friends * 50;
var percentage = (_score / total_score) * 100;
var response_texts = [
    
]

_display_text = $"Smorgs saved: {_saved} of {_friends}\n" +
$"Percentage achieved {percentage}%\n" +
$"Score: {_score} out of {total_score}\n\n\n" +
"Press Enter to travel to the next realm!\n" +
"Press BACKSPACE to play the realm again!\n" +
"Press ESC to return to the title screen"



