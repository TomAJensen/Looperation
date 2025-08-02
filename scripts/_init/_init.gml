

window_set_caption("LOOPERATION - GameCraters(tm) - Visit us at gamecrafters.com. - When it comes to games, we don't play around.")


global.logging_level = "debug"
#macro LOGLEVEL global.logging_level
global.logging_count = 0;
#macro LOGCOUNT global.logging_count
show_debug_message("Script: _init")

global.inst_field_manager = noone;
global.inst_friends_manager = noone;
global.end_text = "";
global.subscribers = noone;
global.message_queue = noone;
global.player_speed = 7;
global.circle_speed = 8;
global.turn = 5.70;
global.speed_index = 0;
global.speeds = [
    [3.25, 4],
    [4.05, 5],
    [4.85, 6],
    [5.70, 7]
]



// turn = 3.25, player_speed = 4 radius = 70.53
// turn 4.05, player_speed 5, radius = 70.75    
// turn 4.85, playe_speed 6, radius = 70.9 *
// turn 5.70, player_speed 7, radius = 70.39 


#macro PLAYER_SPEED global.player_speed
#macro CIRCLE_SPEED global.circle_speed 
#macro TURN global.turn
#macro DIFFICULTY_INFO global.speeds
#macro DIFICULTY global.speed_index  

#macro FIRST_FRIEND 0 
#macro NEXT_FRIEND 1
#macro CLEAR_FIELDS 11

#macro FIELD_DEPLOY_DELAY 3 

#macro MSG_SCREEN_SWITCH "screen_switch" 
#macro MSG_FADE_STATE "fade_state"
#macro MSG_SAVED "saved"
#macro FADED_IN "faded_in"
#macro FADED_OUT "faded_out"   

global.console_texts = {};
global.display_texts = {};

#macro CONSOLE_TEXTS global.console_texts
#macro DISPLAY_TEXTS global.display_texts

global.background_sound = snd_noone;
#macro BKG_SOUND global.background_sound

global.score_info = noone;
#macro SCORE_INFO global.score_info

#macro _X_ 0
#macro _Y_ 1  

global.next_world = rm_test;
#macro NEXT_WORLD global.next_world



