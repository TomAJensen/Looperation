event_inherited();
_smergs = [];
_smerg_index = 0;
//x = -110;


for(var i = 0; i < smerg_count; i++) {
    array_push(_smergs, 0);
}

OBJ_TRACKER[$"bull"]  = id;

_event_types = [MSG_DIED, MSG_SAVED]

_msg_handler = function(msg) {
    switch (msg[$"type"]) {
    	case MSG_DIED: {
            _smergs[_smerg_index++] = 2;
            break;
        }
        case MSG_SAVED: {
            _smergs[_smerg_index++] = 2;
            break;
        }
    }
}
