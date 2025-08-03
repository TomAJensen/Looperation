

/// @function utils_split_and_trim
/// @description split a string at the specified delimiters and trim the items
/// @param {string} _str the string to split
/// @param {string} _delimiter the delimiter to split the sting on
/// @return {Array<String>} array if the split items.
function utils_split_and_trim(_str, _delimiter) {
    var _parts = string_split(_str, _delimiter);
    for (var _i = 0; _i < array_length(_parts); _i++) {
        _parts[_i] = string_trim(_parts[_i]);
    }
    return _parts;
}



function utils_calc_center(x1, y1, x2, y2, x3, y3) {
var d = 2 * (x1 * (y2 - y3) + x2 * (y3 - y1) + x3 * (y1 - y2));
    
    if (abs(d) < 0.0001) {
        // Points are collinear, no unique circle
        return [-1, -1];
    }
    
    var ux = ((x1*x1 + y1*y1) * (y2 - y3) + (x2*x2 + y2*y2) * (y3 - y1) + (x3*x3 + y3*y3) * (y1 - y2)) / d;
    var uy = ((x1*x1 + y1*y1) * (x3 - x2) + (x2*x2 + y2*y2) * (x1 - x3) + (x3*x3 + y3*y3) * (x2 - x1)) / d; 
    return [ux, uy];   
    
}
function utils_find_center(points) {
    var step = int64(array_length(points) / 3);
    var idx = 0;
    var idx1 = idx + step;
    var idx2 = idx1 + step;
    if(array_length(points) < 3) {
        return noone;
    }
    var center = utils_calc_center(
        points[idx][0], points[idx][1],
        points[idx1][0], points[idx1][1],
        points[idx2][0], points[idx2][1]
    )
    
    return center;    
}

function utils_is_friend_enclosed_in_circle(points, obj = obj_friend) {
    var xy = utils_find_center(points);
    if(xy == noone) {
        return {
            "status": false 
        };
    }
    var center_x = xy[0];
    var center_y = xy[1];
    //obj_tracker.x = center_x;
    //obj_tracker.y = center_y;
    
    if(center_x == -1) {
        show_message("No center point")
        return {
            "status": false 
        }
    }
    var friend = instance_find(obj, 0);
    if(friend == noone) {
        return {
            "status": false 
        };
    }
    var xx = points[0][0];
    var yy = points[0][1];
    var radius = point_distance(center_x, center_y, xx, yy)
    
    if(point_in_circle(friend.x, friend.y, center_x, center_y, radius)) {
        // now check that the bbox is enclosed in the circle.
        //var status = point_in_circle(friend.bbox_left, friend.bbox_top, center_x, center_y, radius) ? 1 : 0;
        //status += point_in_circle(friend.bbox_left, friend.bbox_bottom, center_x, center_y, radius) ? 1 : 0;
        //status += point_in_circle(friend.bbox_right, friend.bbox_top, center_x, center_y, radius) ? 1 : 0;
        //status += point_in_circle(friend.bbox_right, friend.bbox_bottom, center_x, center_y, radius) ? 1 : 0;
        //if(status == 4) {
            //// enclosed
            //return true;
        //}
        return {
            "status":true,
            "center_x": center_x,
            "center_y": center_y,
            "radius": radius
        }
    }
    // not enclosed
    return {
            "status": false 
        }
}

function utils_kill_background_sound() {
    audio_stop_sound(BKG_SOUND)
}

function utils_play_background(sound, loop, gain) {
    if(BKG_SOUND != snd_noone) {
        audio_stop_sound(BKG_SOUND)
    }
    BKG_SOUND =  audio_play_sound(sound, 0, loop, gain)
}

/* ##############################################################
 *       COLLISION UTILITIES
 * ##############################################################
 */ 

/// @function utils_get_collision_dir
/// @description Determine which directions _who is colliding with _what
/// @param {id.Instance} _what the object collided with
/// @param {id.Instance} _who what object collided with _what
/// @return {struct} {"x": <direction on x axis>, "y": <direction on y axis>}
function utils_get_collision_dir(_what, _who) {
    
    var _dir_lr;
    var _dir_tb
    if(_who.bbox_left >= _what.bbox_left &&
        _who.bbox_right <= _what.bbox_right && 
        _who.bbox_top >= _what.bbox_top && 
        _who.bbox_bottom <= _what.bbox_bottom) { 
        // who is enclosed in what.
            _dir_lr = _who.x <= _what.x ? "left" : "right";
            _dir_tb = _who.y <= _what.y ? "top" : "bottom"
            
    } else {

    	// check left/right
    	_dir_lr = _who.bbox_left < _what.bbox_left ? "left" : 
    	(_who.bbox_right > _what.bbox_right ? "right": "");
    	
    	// check top/bottom
    	_dir_tb = _who.bbox_bottom > _what.bbox_bottom ? "bottom" :
    	(_who.bbox_top < _what.bbox_top ? "top" : "");
    }
    
	return {"x" : _dir_lr, "y" : _dir_tb}
            
	
}	

/// @function utils_uncollide
/// @description adjust x, y of _who so bounding boxes don't overlat based on _direction
///	@param {string} _side a string indicating which side "left", "right", "top", "bottom"
///	@param {id.instance<Any>} _what the object collided with
///	@param {id.Instance<any>} _who the object that collided with _what
/// @return {struct} a validation structure with properties:
///                     - valid: flag indicating the uncollide was a valid operation
///                     - 
function utils_un_collide(_side, _what, _who) {
	/***
	adjust x, y of _who so bounding boxes don't overlat based on _direction
	:param _direction a string indicating direction "left", "right", "top", "bottom"
	:param _what the object collided
	:param _who the object that collided with _what
	***/
	var _diff = 0;
	var _axis = "";
	
	// Check bounding boxes base on direction
	switch(_side) {
		case "top":
			_diff = _who.bbox_bottom -  _what.bbox_top;
			_axis = "y";
			break;
			
		case "bottom":
			_diff = _what.bbox_bottom - _who.bbox_top;
			_axis = "y";
			break;
	
		case "left":
			_diff = _who.bbox_right - _what.bbox_left;
			_axis = "x";
			break;
		case "right":
			_diff = _what.bbox_right - _who.bbox_left;
			_axis = "x";
			break;	
        default:
            return {"valid": false, "adjusted": false};
            
	} 
		
	// determin wether to move _who in a positive or a negative direction.
	var _adjustment_dir = _diff < 0 ? 0 : (_side == "top" || _side == "left" ? -1 : 1);
	
	_diff = (_diff + 1) * _adjustment_dir; // multiply by 1 or -1 
	
	// determine which axis to update and update the position
	switch(_axis) {
		case "x":
			_who.x += _diff; // update x axis
			break;
		case "y":
			_who.y += _diff; // update y axis
			break;
	}
	
	return _axis == "" ? {"valid": false, "adjusted": false} : (_adjustment_dir != 0 ? {"valid": true, "adjusted": true} : {"valid": true, "adjusted": false});
}

/// @function utils_align_objects
/// @description align abject 1 to object 2 based on direction
/// @param {id.Instance} _inst the instance to align
/// @param {id.Instance} _inst_align_to the instance to align object to
/// @param {string} _dir how to align 
function utils_align_objects(_inst, _inst_align_to, _dir) {
    switch(_dir) {
        case EDG_TOP:
            _inst.y = _inst_align_to.bbox_top - 1;
            break;
        case EDG_BOTTOM:
            
        case EDG_LEFT:
            
        case EDG_RIGHT:
            
        case CENTER:
            show_message($"utils_align_objects {_dir} not implemented.")
        default:
            show_message($"utils_align_object bad direction passed {_dir}")
            break;
    }
}

function utils_place_friend_by_borders(border_x, border_y) {
    var xx = irandom_range(border_x, room_width - border_x * 2 );
    var yy = irandom_range(border_y, room_height - border_y * 2);
    return [xx,yy];
}

function utils_place_friend() {
    return utils_place_friend_by_borders(room_width / 8, room_height / 8);
}

function utils_boundry_adjust(who) {
    var boundry = who.check_collision();
    if(boundry != noone) {
        var collision_info = utils_get_collision_dir(boundry, who)
        var side = collision_info[$"x"] != "" ? collision_info[$"x"] : collision_info[$"y"];
        utils_un_collide(side, boundry, who)
    }
    who.reposition();
}

/// @param {Asset.GMSound} new_snd sound to start
/// @param {Id.Sound} snd_id id of sound to stop if playing
function utils_start_sound(new_snd, snd_id) {
    if(snd_id != 0) {
        audio_stop_sound(snd_id);
    }
    return audio_play_sound(new_snd, 100, false);
}
/// @param {Id.Sound} snd_id soudn to stop
function utils_stop_sound(snd_id) {
    if(snd_id != 0) {
        audio_stop_sound(snd_id);
    }
}


