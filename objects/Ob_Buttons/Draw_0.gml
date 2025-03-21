if (hovered)
{
	draw_sprite_ext(sprite_index, 0, x, y, 1.1, 1.1, 0, c_white, 1)
}
else
{	
	draw_self()
}


draw_set_color(c_black)
draw_set_halign(fa_center)
draw_text(x, y + sprite_height / 2 + 10, btn_text)