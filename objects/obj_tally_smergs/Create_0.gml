event_inherited();
_smergs = [];
_smerg_index = 0;
_smerg_count = 0;
//x = -110;




OBJ_TRACKER[$"bull"]  = id;

_event_types = [MSG_DIED, MSG_SAVED, MSG_TOTAL_SMORGS]

_msg_handler = function(msg) {
    switch (msg[$"type"]) {
    	case MSG_DIED: {
            _smergs[_smerg_index++] = 2;
            break;
        }
        case MSG_SAVED: {
            _smergs[_smerg_index++] = 1;
            break;
        }
        case MSG_TOTAL_SMORGS: {
            _smerg_count = msg[$ "data"]
            for(var i = 0; i < _smerg_count; i++) {
                array_push(_smergs, 0);
            }
            break;
        }
    }
    return true;
}
