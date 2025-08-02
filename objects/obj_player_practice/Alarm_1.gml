/// @description 
if(instance_find(obj_field, 0)) {
    alarm[NEXT_FRIEND] = 5
    return;
}
var inst = instance_find(obj_friend_manager, 0);
if(inst != noone) {
    inst.next_friend();
}