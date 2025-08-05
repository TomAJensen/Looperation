

window_set_caption("LOOPERATION - GameCraters(tm) - Visit us at gamecrafters.com. - When it comes to games, we don't play around.")


global.logging_level = "debug"
#macro LOGLEVEL global.logging_level
global.logging_count = 0;
#macro LOGCOUNT global.logging_count
show_debug_message("Script: _init")


// powerups are gained by touching them.
global.current_powerup = "";
#macro CURRENT_POWER_UP global.current_powerup
#macro PU_TRACKING_CIRCLE "pu_tracking_circle" // Cicle follows player showing where they will circle.
#macro PU_TARGETING_CIRCLE = "pu_targeting_circle" // Places a circle around the Smorg
#macro PU_TIME_DILATION "pu_time_dilation" // Slows down time.
#macro PU_SMORG_ARMOR "pu_armor" // The smorg hs armor to protect him from damage, player bounces off.
#macro PU_HEALTH_BOMB "pu_health_bomb" // Restores the smorg to full health
#macro ETHEREAL "pu_ehtereal"  // Player passes through things like a ghost.
#macro PU_SMART_BOMB "pu_smart_bomb" // clears all duplicated mines 
#macro PU_AUTO_CIRCLE "pu_auto_circle" // if player within range, moved teh player t the circle and circles automatically.



#macro OBS_SPLITTING_MINE "obs_splitting_mine" // Splits into 4 mines that the player bounces off.
#macro OBS_PORTAL "obs_portal" // 2 portals appear and the player jumps between them.
#macro OBS_EXPLOSIVE_MINES "obs_mine" // player looses control for a set time.
#macro OBS_DRIFTING_MINES  "obs_drifting_mines" // mines that drift around that the player bounces off and the mine disappears to be respawned. (smart bomb will get rid) 
#macro OBS_GRAVITY_WELLS "obs_gravity_well" // areas that bend space so players direction is affected.

#macro TIMED_POSITIONS_COUNT 10

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
#macro MSG_PORTAL "portal"
#macro MSG_NEXT_FRIEND "next_friend" 
#macro MSG_POP "pop" 
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
global.current_world = rm_test
#macro CURRENT_WORLD global.current_world

global.game_speed = 0;
#macro FPS global.game_speed

global.score_info_per_world = {}
#macro WORLD_SCORE_INFO global.score_info_per_world


#macro ROOM_BORDER_WIDTH 64 



