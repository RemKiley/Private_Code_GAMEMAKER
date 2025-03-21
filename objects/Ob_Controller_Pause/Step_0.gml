if (!keyboard_check(vk_escape)) 
{
    global.escape_lock = false
}

if (keyboard_check_pressed(vk_escape) && !global.escape_lock)
{
    global.escape_lock = true

    if (!global.game_paused)
    {
        global.game_paused = true
        instance_create_layer(x, y, "Instances_2", Ob_Pause_Menu)

        global.paused_animations = []
        with (all)
        {
            if (sprite_index != -1 && image_speed > 0)
            {
                array_push(global.paused_animations, id)
                image_speed = 0;
            }
        }

        audio_stop_sound(global.current_music)
        if (!audio_is_playing(So_Pause))
        {
            audio_play_sound(So_Pause, global.music_volume, true)
        }
    }
    else
    {
        global.game_paused = false

        with (instance_find(Ob_Pause_Menu, 0))
        {
            instance_destroy()
        }

        RestoreAnimations()

        audio_stop_sound(So_Pause)
        if (!audio_is_playing(global.current_music))
        {
            audio_play_sound(global.current_music, global.music_volume, true);
        }
    }
}

function RestoreAnimations()
{
    for (var i = 0; i < array_length(global.paused_animations); i++)
    {
        var obj = global.paused_animations[i];
        if (instance_exists(obj))
        {
            obj.image_speed = 1;
        }
    }
    global.paused_animations = [];
}