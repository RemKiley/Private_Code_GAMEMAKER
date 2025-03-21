if (keyboard_check_pressed(vk_f11))
{
    var _is_fullscreen = window_get_fullscreen()
    window_set_fullscreen(!_is_fullscreen)
}