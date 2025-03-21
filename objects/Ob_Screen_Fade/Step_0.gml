if (fade_in)
{
	audio_play_sound(So_Fade, global.music_volume, false)
    fade_alpha = clamp(fade_alpha + fade_speed, 0, 1)
    if (fade_alpha == 1 && next_room != -1) 
	{
        room_goto(Room_Game)
    }
}