var info = utils_get_collision_dir(other.id, id);
hspeed = info[$"x"] != "" ? -hspeed : hspeed;
vspeed = info[$"y"] != "" ? -vspeed : vspeed;

utils_un_collide(info[$"x"], other.id, id);
utils_un_collide(info[$"y"], other.id, id);