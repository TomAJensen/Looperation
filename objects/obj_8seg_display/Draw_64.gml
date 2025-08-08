/// @description display the number

var num = _current_number;
var xx = _xpos;
for(var i = 0; i < number_of_digits; i++) {
    var digit = num % 10;
    draw_sprite(spr_8_seg_nums, digit, xx, y);
    xx -= sprite_width;
    num = int64(num / 10);
}
    
    
    
    