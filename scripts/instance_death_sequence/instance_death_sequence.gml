function instance_death_sequence()
{
    if (!player_is_dead)
	{
        player_is_dead = true
        sprite_index = death_sprite
        image_speed = 1
        death_timer = room_speed * 2

        _vertical_speed = 0
        _can_jump = false
    }
}