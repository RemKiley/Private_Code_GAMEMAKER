if (variable_global_exists("tv_state")) 
{
    tv_on = global.tv_state
}
else
{
    tv_on = false
}

if (variable_global_exists("tv_blink_done"))
{
    blink_done = global.tv_blink_done
}
else
{
    blink_done = false
}


if (blinking)
{
    blink_time += 1

    if (blink_time <= blink_duration)
    {
        if (blink_time mod blink_interval == 0)
        {
            sprite_index = (sprite_index == Sp_Television_Off) ? Sp_Television_On : Sp_Television_Off
        }
    } 
    else
    {
        sprite_index = Sp_Television_On
        blinking = false
        initialized = true
        tv_on = true
        blink_done = true
        global.tv_state = true
        global.tv_blink_done = true
    }
}


if (!blinking && global.tv_blink_done && !tv_on)
{
    tv_on = true
    blink_done = true
    sprite_index = Sp_Television_On
}


if (tv_on && !audio_is_playing(So_Menu))
{
    audio_play_sound(So_Menu, global.music_volume, true)
}


if (tv_on && !button_create)
{
    button_create = true

    var start_button = instance_create_layer(btn_x, btn_y_start, "Instances_1", Ob_Start_Bottom)
    start_button.btn_text = "START"
    start_button.action_type = "START"

    var setting_button = instance_create_layer(btn_x, btn_y_start + btn_spacing, "Instances_1", Ob_Setting_Button)
    setting_button.btn_text = "SETTINGS"
    setting_button.action_type = "SETTINGS"

    var quit_button = instance_create_layer(btn_x, btn_y_start + btn_spacing * 2, "Instances_1", Ob_Quit_Bottom)
    quit_button.btn_text = "EXIT"
    quit_button.action_type = "EXIT"
}


if (!tv_on && !blink_done && !global.tv_blink_done && keyboard_check_pressed(vk_anykey))
{
    StartBlinking()
}

if (tv_on && audio_is_playing(So_Menu))
{
    audio_sound_gain(So_Menu, global.music_volume, 0)
}