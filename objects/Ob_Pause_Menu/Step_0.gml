if (keyboard_check_pressed(vk_escape) && global.game_paused)
{
    global.game_paused = false
    global.escape_lock = true

    with (Ob_Controller_Pause)
    {
        RestoreAnimations()
    }

    instance_destroy()
    audio_stop_sound(So_Pause)
    if (!audio_is_playing(global.current_music))
    {
        audio_play_sound(global.current_music, global.music_volume, true);
    }
}
else if (!global.game_paused && !audio_is_playing(So_Pause))
{
    global.paused_animations = []
    with (all)
    {
        if (sprite_index != -1 && image_speed > 0)
        {
            array_push(global.paused_animations, id)
            image_speed = 0;
        }
    }

    audio_play_sound(So_Pause, 1, true)
    audio_sound_gain(So_Pause, global.music_volume, 0);
}

if (keyboard_check_pressed(vk_up))
{
    selected_option -= 1
    if (selected_option < 0) selected_option = array_length(menu_options) - 1
}

if (keyboard_check_pressed(vk_down))
{
    selected_option += 1
    if (selected_option >= array_length(menu_options)) selected_option = 0
}

if (keyboard_check_pressed(vk_enter))
{
    if (selected_option == 0)
    {
        global.game_paused = false

        with (Ob_Controller_Pause)
        {
            RestoreAnimations()
        }

        instance_destroy()
        audio_stop_sound(So_Pause)
        if (!audio_is_playing(global.current_music))
        {
            audio_play_sound(global.current_music, global.music_volume, true)
        }
    }
    else if (selected_option == 1)
    {
        game_end()
    }
}

audio_sound_gain(So_Pause, global.music_volume, 0)