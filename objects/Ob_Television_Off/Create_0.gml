if (!variable_global_exists("tv_state")) 
{
    global.tv_state = false
}
if (!variable_global_exists("tv_blink_done"))
{
    global.tv_blink_done = false
}

blink_done = global.tv_blink_done
tv_on = global.tv_state


if (tv_on || blink_done)
{
    tv_on = true
    blink_done = true
    sprite_index = Sp_Television_On
    blinking = false
}
else
{
    sprite_index = Sp_Television_Off
    blinking = false
}

blink_time = 0
blink_duration = 55
blink_interval = 10
initialized = false

screen_center_x = 1366 / 2
screen_center_y = 768 / 2
tv_width = 800
tv_height = 400
tv_x = screen_center_x - tv_width / 2
tv_y = screen_center_y - tv_height
btn_spacing = 160
btn_y_start = tv_y + tv_height / 2
btn_x = tv_x + tv_width - 430
button_create = false