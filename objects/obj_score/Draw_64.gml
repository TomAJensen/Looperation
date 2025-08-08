var xx = 34;
for(var i = 0; i < _saved_total; i++) {
    draw_sprite(spr_smerg, _saved[i][1], xx, 30);
    var a = _saved[i][1];
    var calced_score = (5 - a) * 10;
    display_idividual_score(xx, calced_score)
    xx += 50;
}

for(var i = 0; i < _friends - _saved_total; i++) {
    draw_sprite(spr_ghost_smerg, 1, xx, 30);
    display_idividual_score(xx, 0);
    xx += 50;
}
