if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width, y + sprite_height)) 
{
	audio_play_sound(So_Button_Click, 0.2, false)
    global.tv_state = true
    global.tv_blink_done = true
    
    with (Ob_Television_Off) 
    {
        blinking = false
        blink_done = true
        sprite_index = Sp_Television_On
    }

    room_goto(Room1)
}