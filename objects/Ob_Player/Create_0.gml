_vertical_speed = 0
_player_gravity = 0.16
_vertical_speed_max = 10
_jump_speed = -7.2
_can_jump = true
_spd = 4
_run_speed = 8
_acceleration = 0.2
_current_speed = _spd
player_takes_damage = false
player_invincible = false
player_knockback = false
knockback_timer = 0
knockback_hspeed = 0
knockback_vspeed = 0
player_is_dead = false
death_timer = 0
death_sprite = Sp_Player_Death
attack = false
attack_timer = 0
on_ladder = false
climbing = false
_fall_speed = 10
_double_jump_used = false
game_paused = false
var _keyup = keyboard_check ( vk_up )
var _keydown = keyboard_check ( vk_down )
var _vmove = _keydown - _keyup

global.game_paused = false
global.player_health = 3
global.max_health = 3
global.health_states = []
global.heart_animation = []

for (var i = 0; i < global.max_health; i++)
{
    global.health_states[i] = (i < global.player_health) ? 1 : 0
    global.heart_animation[i] = 0
}

if (!variable_global_exists("player_spawn_x")) global.player_spawn_x = 0
if (!variable_global_exists("player_spawn_y")) global.player_spawn_y = 0

if (global.player_spawn_x != undefined && global.player_spawn_y != undefined)
{
    x = global.player_spawn_x
    y = global.player_spawn_y
}