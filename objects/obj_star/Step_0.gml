event_inherited();
_collison_delay = max(0, _collison_delay - 1);
if(_inportal) {
    image_angle += 10;
    image_xscale = max(0, image_xscale - .08);
    image_yscale = max(0, image_yscale - .08);
}
