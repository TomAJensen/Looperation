msg_unsubscribe(inst_name);
var inst_shadow = instance_find(obj_friend_shadow, 0);
inst_shadow.image_alpha = 0;
inst_shadow._alpha_adjust = abs(inst_shadow._alpha_adjust);
if(_inst_mover != noone) {
    instance_destroy(_inst_mover);
}
