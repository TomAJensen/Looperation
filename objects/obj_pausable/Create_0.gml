_alarm_states = [-1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1];
_paused = false;
function pause() {
    for(var i = 0; i < 11; i++) {
        _alarm_states[i] = alarm[i];
        alarm[i] = -1;
    }
    _paused = true;
}

function un_pause() {
    for(var i = 0; i < 11; i++) { 
        alarm[i] = _alarm_states[i];
    }
    _paused = false;
}

_step_event = function() {
    loginfo("No step event registered.")
}
