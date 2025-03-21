if (!variable_global_exists("is_fading") || global.is_fading) 
{
    return
}


if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2))
{
    if (global.selected_slot > 0)
    {
        var fade = instance_create_layer(0, 0, "Instances_1", Ob_Screen_Fade)
        fade.fade_direction = 0;
        fade.next_room = Room_Game

        if (audio_is_playing(So_Menu))
		{
            audio_stop_sound(So_Menu)
        }
    }
    else
    {
    var active_messages = instance_number(Ob_Messenge_Box)
    if (active_messages < 4)
	{
        var msg = instance_create_layer(room_width / 2, -50, "Instances", Ob_Messenge_Box)
        msg.message_text = "Please select a save slot first!"
        msg.visible = true
	}
	}
}