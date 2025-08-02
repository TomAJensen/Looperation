/// @description 
if(!_running) {
    return;
}

if(image_angle > 720) {
    instance_destroy();
    return;
}

image_angle += 10;
image_alpha -= .03;
image_xscale += 20 * .014;
image_yscale += 20 * .014;