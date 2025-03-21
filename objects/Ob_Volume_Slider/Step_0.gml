if (mouse_check_button(mb_left))
{
    if (mouse_x > slider_x && mouse_x < slider_x + slider_width && abs(mouse_y - slider_y) < 10)
	{
        slider_position = clamp(mouse_x - slider_x, 0, slider_width)
        global.music_volume = slider_position / slider_width

        if (variable_global_exists("current_music") && global.current_music != -1) 
		{
            audio_sound_gain(global.current_music, global.music_volume, 0)
        }
        
        if (audio_is_playing(So_Menu))
		{
            audio_sound_gain(So_Menu, global.music_volume, 0)
        }
    }
}