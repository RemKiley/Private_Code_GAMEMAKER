start_timer += 1

if (start_timer >= start_duration)
{
	fade_alpha += fade_speed
	if (fade_alpha >= 1)
	{
		room_goto(Room1)
	}
}