ds_map_clear(global.subscribers);
ds_list_clear(global.message_queue);
_score = SCORE_INFO[$"score"]
_saved = SCORE_INFO[$"saved"]
_saved_total = array_length(_saved)
_friends = SCORE_INFO[$"friends"]
var world_name = room_get_name(CURRENT_WORLD);
WORLD_SCORE_INFO[$world_name] = SCORE_INFO;
_curx = x;
_cury = y;
 x = -100;


for(var i = 0; i < _saved_total; i++) {
    instance_create_layer(0,0,"drifters", obj_friend_drift)
}
for(var i = 0; i < _friends - _saved_total; i++) {
    instance_create_layer(0,0,"drifters", obj_friend_drift, { "image_index": 1, "image_alpha": .65})
}
for(var i = 0; i < _saved_total; i++) {
    
}

//var total_score = _friends * 50;
//var percentage = (_score / total_score) * 100;
//var response_texts = [
    //
//]
var next_world_text = room_get_name(NEXT_WORLD) == "rm_end" ? "complete your travels!" : "travel to the next realm!";
//_display_text = $"Smorgs saved: {_saved} of {_friends}\n" +
//$"Percentage achieved {percentage}%\n" +
_display_text =  $"Press Enter to {next_world_text}\n" +
"Press BACKSPACE to play the realm again!\n" +
"Press ESC to return to the title screen"


function display_idividual_score(xx, calced_score) {
    var the_score = calced_score;
    var num = the_score % 10;
    var xpos = xx + int64((2 * 7) / 2);
    
    draw_sprite(spr_8seg_nums_tiny, num, xpos , 30 + 24 + 3);
    xpos -= 7;
    the_score = int64(the_score / 10);
    num = the_score % 10;
    draw_sprite(spr_8seg_nums_tiny, num, xpos , 30 + 24 + 3);
        //xpos += 7;
        //the_score = int64(the_score / 10);
        //num = the_score % 10;
        //draw_sprite(spr_8seg_nums_tiny, num, xpos , 30 + 24 + 3);


}


