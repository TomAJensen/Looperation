
DIFICULTY = _cur_difficulty;
var info = DIFFICULTY_INFO[DIFICULTY];
PLAYER_SPEED = info[1];
TURN = info[0]
msg_publish(msg_build_msg(MSG_SCREEN_SWITCH, inst_name, {"action": "next_screen"}));