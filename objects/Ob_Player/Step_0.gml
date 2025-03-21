if (global.game_paused)
{
	exit
}

var target_speed = _spd
var _keyup = keyboard_check ( vk_up )
var _keydown = keyboard_check ( vk_down )
var _vmove = _keydown - _keyup
//running
if (keyboard_check(vk_shift))
{
    target_speed = _run_speed
}

if (_current_speed < target_speed)
{
    _current_speed = min(_current_speed + _acceleration, target_speed)
} else if (_current_speed > target_speed)
{
    _current_speed = max(_current_speed - _acceleration, target_speed)
}
if (!place_meeting(x, y + 1, Ob_All_Block))
{
    _vertical_speed = min(_vertical_speed + _player_gravity, _vertical_speed_max)
    _can_jump = false

    if (_vertical_speed > 0 && !player_is_dead)
	{
        sprite_index = Sp_Player_Fall
    }
}
else 
{
    _vertical_speed = 0
    _can_jump = true
}
//moving
if (!attack) 
{
    var move_x = 0

    if (keyboard_check(vk_left))
    {
        move_x = -_current_speed
        image_xscale = -1
    }
    else if (keyboard_check(vk_right))
    {
        move_x = _current_speed
        image_xscale = 1
    }

    if (move_x != 0)
    {
        var steps = abs(move_x)
        var step_x = sign(move_x)

        for (var i = 0; i < steps; i++)
        {
            if (!place_meeting(x + step_x, y, Ob_All_Block))
            {
                x += step_x
            }
            else
            {
                break
            }
        }

        if (!player_is_dead)
        {
            sprite_index = keyboard_check(vk_shift) ? Sp_Player_Run : Sp_Player_Walk
        }
    }
    else
    {
        if (_vertical_speed == 0 && !player_is_dead)
        {
            sprite_index = Sp_Player_Idle
        }
    }
}
//graviti and jumping
if (!climbing)  
{
    if (!attack && keyboard_check_pressed(vk_space)) 
    {
        if (_can_jump) 
        {
            _vertical_speed = _jump_speed
            _can_jump = false
            if (!player_is_dead) sprite_index = Sp_Player_Jump
        } 
        else if (!_double_jump_used) 
        {
            _vertical_speed = _jump_speed * 0.8
            _double_jump_used = true
            if (!player_is_dead) sprite_index = Sp_Player_Jump
        }
    }

    _vertical_speed += _player_gravity
    if (_vertical_speed > _vertical_speed_max) _vertical_speed = _vertical_speed_max

    if (!place_meeting(x, y + _vertical_speed, Ob_All_Block)) 
    {
        y += _vertical_speed
    }
    else 
    {
        while (!place_meeting(x, y + sign(_vertical_speed), Ob_All_Block)) 
        {
            y += sign(_vertical_speed)
        }

        if (_vertical_speed > 0) 
        {
            _can_jump = true
            _double_jump_used = false
        }

        _vertical_speed = 0
    }
}
//damage
if (player_takes_damage)
{
    if (global.player_health > 0) 
    {
        global.player_health -= 1

        for (var i = global.max_health - 1; i >= 0; i--) 
        {
            if (global.health_states[i] == 1)
            {
                global.health_states[i] = 0;
                global.heart_animation[i] = 10;
                break;
            }
        }

        player_invincible = true
        alarm[0] = room_speed * 3

        if (global.player_health <= 0) 
        {
            instance_death_sequence()
        }
    }
    player_takes_damage = false
}

// GET OUT PLAYER
if (player_knockback)
{
    var next_x = x + knockback_hspeed
    var next_y = y + knockback_vspeed

    if (!place_meeting(next_x, y, Ob_All_Block))
    {
        x = next_x
    }
    else
    {
        knockback_hspeed = 0
    }

    if (!place_meeting(x, next_y, Ob_All_Block))
    {
        y = next_y
    }
    else
    {
        knockback_vspeed = 0
    }

    knockback_timer -= 1
    if (knockback_timer <= 0)
    {
        player_knockback = false
    }
}

if (player_invincible)
{
    image_alpha = (current_time div 200) mod 2
}
else
{
    image_alpha = 1
}
//arrow
if (place_meeting(x, y, Ob_Door))
{
    if (!instance_exists(Ob_Arrow))
	{
        instance_create_layer(x, y - 40, "Instances_1", Ob_Arrow)
    }
}
else 
{
    if (instance_exists(Ob_Arrow)) 
	{
        with (Ob_Arrow)
		{
            instance_destroy()
        }
    }
}

if (player_is_dead) 
{
    death_timer -= 1
    if (death_timer <= 0)
	{
        room_restart()
    }
    exit
}
//attack
if (!attack && _can_jump && keyboard_check_pressed(ord("X")))  
{
    attack = true
    sprite_index = Sp_Player_Attack
    image_index = 0
    image_speed = 0.9
}

if (attack) 
{
    if (image_index >= image_number - 0.1) 
    {
        attack = false
        sprite_index = _can_jump ? Sp_Player_Idle : Sp_Player_Fall
        image_speed = 1
    }

 if (image_index >= 2.3 && !instance_exists(Ob_AttackHitbox)) 
{
    var hitbox_x = x + (image_xscale * 16)
    var hitbox_y = y
    var hitbox = instance_create_layer(hitbox_x, hitbox_y, "Instances_1", Ob_AttackHitbox)
    hitbox.image_xscale = image_xscale
}
}

if (player_takes_damage) 
{
    attack = false
}
//ladder
if (place_meeting(x, y + 1, Ob_Ladder))  
{
    if (keyboard_check(vk_up) || keyboard_check(vk_down) || climbing)
    {
        climbing = true
    }
    else
    {
        climbing = false
    }
}
else
{
    climbing = false
}

if (climbing) 
{
    _vertical_speed = 0

    if (keyboard_check(vk_up)) 
    {
        if (!place_meeting(x, y - _spd, Ob_All_Block))
        {
            y -= _spd
        }
    } 
    else if (keyboard_check(vk_down)) 
    {
        if (!place_meeting(x, y + _spd, Ob_All_Block)) 
        {
            y += _spd
        }
        else
        {
            climbing = false
        }
    }

    if (!place_meeting(x, y, Ob_Ladder) || keyboard_check_pressed(vk_space)) 
    {
        climbing = false
        _vertical_speed = 0
    }

    if (keyboard_check(vk_up) && !place_meeting(x, y - _spd, Ob_Ladder)) 
    {
        climbing = false
        _vertical_speed = _jump_speed * 0.5
        y -= 2
    }

    if (climbing)
    {
        _vertical_speed = _vmove * _spd
        sprite_index = Sp_Player_Climbing
    }
}
//Menu
if (keyboard_check_pressed(vk_escape) && !global.game_paused && !global.escape_lock)
{
    global.game_paused = true
    global.escape_lock = true
    instance_create_layer(x, y, "Instances_2", Ob_Pause_Menu)

    audio_stop_sound(global.current_music)
    if (!audio_is_playing(So_Pause))
    {
        audio_play_sound(So_Pause, global.music_volume, true)
    }
}