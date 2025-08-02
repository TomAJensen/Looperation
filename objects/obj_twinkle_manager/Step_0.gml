var count = 0;
with(obj_twinkle) {
    count++;
}

for(var i = 0; i < 30 - count; i++) {
    instance_create_layer(irandom(room_width), irandom(room_height), "twinkles", obj_twinkle);
}