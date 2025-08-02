/// @description 
image_angle += 1;

if( x < -30 ) {
    x = room_width + 29;
} else if(x > room_width + 30) {
    x = -29;
}

if(y < -30) {
    y = room_height + 29;
} else if(y > room_height + 30) {
    y = -29;
}