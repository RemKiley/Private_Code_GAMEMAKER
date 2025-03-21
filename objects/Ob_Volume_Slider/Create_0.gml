slider_x = 100
slider_y = 200
slider_width = 300

if (!variable_global_exists("music_volume"))
{
    global.music_volume = 0.5
}

slider_position = global.music_volume * slider_width