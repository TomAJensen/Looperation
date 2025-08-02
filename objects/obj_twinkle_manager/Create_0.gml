visible = false;

for(var i = 0; i < 30; i++) {
    instance_create_layer(irandom(room_width), irandom(room_height), "twinkles", obj_twinkle);
}