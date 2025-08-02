
function log_at_level(_level, _log_info) {
    var level_struct = {"debug": 4, "warning": 3, "info": 2}
    var log_level = level_struct[$ LOGLEVEL]
	var _level_representation = ""; 
	switch(_level) {
		case "debug":
			_level_representation =  log_level >= 4 ? "DEBUG:" : "";
			break;
		case "warning":
			_level_representation = log_level >= 3 ? "WARNING:" : "";
			break;
		case "info":
			_level_representation = log_level >= 2 ? "INFO:" : "";
			break;
		case "fatal":
			// this is a condition that prevents the game from continuing.
			_level_representation =  "FATAL: ";
			show_message("FATAL: " + string(_log_info));
			game_end();
			break;
			
	}
    if(_level_representation != "") {
	    show_debug_message($"({++LOGCOUNT}){_level_representation} {string(_log_info)}");
    }
}


function loginfo(_log_info) {
	log_at_level("info", _log_info);
}

function logdebug(_log_info) {
	log_at_level("debug", _log_info);
}

function logwarning(_log_info) {
	log_at_level("warning", _log_info);
}

loginfo("Script: _logging")