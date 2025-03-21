if (global.game_paused)
{
	exit
}

if (!place_meeting(x, y + 1, Ob_All_Block))
{
    vel_y += grav_spd
    grounded = false
}
else 
{
    vel_y = 0
    grounded = true
}

if (!place_meeting(x, y + vel_y, Ob_All_Block))
{
    y += vel_y
}
else
{
    while (!place_meeting(x, y + sign(vel_y), Ob_All_Block))
	{
        y += sign(vel_y)
    }
    vel_y = 0
}

if (place_meeting(x + vel_x, y, Ob_All_Block))
{
    vel_x = -vel_x
}

x += vel_x

if (grounded)
{
    var ground_ahead = place_meeting(x + sign(vel_x) * 16, y + 1, Ob_All_Block)

    if (!ground_ahead)
	{
        vel_x = -vel_x
    }
}

if (vel_x > 0) 
{
    image_xscale = 1
}
else 
{
    image_xscale = -1
}

var player = instance_place(x, y, Ob_Player)

if (player != noone && !player.player_invincible)
{
    with (player)
    {
        player_takes_damage = true
        player_invincible = true
        alarm[0] = room_speed * 3

        player_knockback = true  
        knockback_timer = 15
        knockback_hspeed = sign(x - other.x) * 3
        knockback_vspeed = -3
    }
}