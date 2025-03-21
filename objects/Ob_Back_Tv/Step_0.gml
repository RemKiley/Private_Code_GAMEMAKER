if (!variable_global_exists("is_fading") || global.is_fading)
{
    return
}


if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2))
{
	global.selected_slot = -1
    room_goto(Room1)
}