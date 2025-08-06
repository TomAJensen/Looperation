return
var info = utils_get_collision_dir(other.id, id);
hspeed = info[$"x"] != "" ? -hspeed : hspeed;
vspeed = info[$"y"] != "" ? -vspeed : vspeed;

//utils_un_collide(info[$"x"], other.id, id);
//utils_un_collide(info[$"y"], other.id, id);

var i = 1;
var xx = x;
var yy = y;
while(place_meeting(xx, yy, other.id)) {
    xx = lengthdir_x(i, direction) + x;
    yy = lengthdir_x(i, direction) + y;
    i++;
}

x = xx;
y = yy;

