if (player_is_dead)
{
    draw_sprite(death_sprite, 0, x, y)
    exit
}

if (player_invincible)
{
    if (current_time mod 1 == 0)
	{
        draw_self()
    }
} 
else 
{
    draw_self()
}

var heart_full_sprite = Sp_Heart_Full
var heart_empty_sprite = Sp_Heart_Empty
var heart_size = 32
var heart_padding = 20
var start_x = camera_get_view_x(view_camera[0]) + 1215
var start_y = camera_get_view_y(view_camera[0]) + 60

for (var i = 0; i < global.max_health; i++) 
{
    if (global.heart_animation[i] > 0)
	{
        var scale = 1 - (global.heart_animation[i] / 10)
        draw_sprite_ext(
            heart_full_sprite, 
            0, 
            start_x + i * (heart_size + heart_padding), 
            start_y, 
            scale, 
            scale, 
            0, 
            c_white, 
            1
        )
        global.heart_animation[i] -= 1
    }
	else 
	{
        var sprite_to_draw = (global.health_states[i] == 1) ? heart_full_sprite : heart_empty_sprite
        draw_sprite(sprite_to_draw, 0, start_x + i * (heart_size + heart_padding), start_y)
    }
}