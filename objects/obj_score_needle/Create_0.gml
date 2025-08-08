event_inherited();


_event_types = [MSG_SCORE]
_score_current = 0;
_score_new = 0;
_score_possible = 100;
_score_delay = 1; //game_get_speed(gamespeed_fps)
alarm[0] = _score_delay;

#macro SCORE_CURRENT "score" 
#macro SCORE_POSSIBLE "possible"
_msg_handler = function(msg) {
    _score_new = msg[$"data"][$ SCORE_CURRENT];
    _score_possible = msg[$"data"][$ SCORE_POSSIBLE];
    return true;
}


