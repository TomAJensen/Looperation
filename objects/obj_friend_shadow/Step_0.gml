image_alpha += _alpha_adjust;
if(image_alpha < _min_alpha && _alpha_adjust < 0) {
    image_alpha = _min_alpha;
    _alpha_adjust = .0035;
} else if(image_alpha > _max_alpha ) {
    image_alpha = _max_alpha;
    _alpha_adjust = -.0035;
}
