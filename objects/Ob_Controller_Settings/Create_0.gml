if (!variable_global_exists("music_volume"))
{
    global.music_volume = 0.5
}
audio_sound_gain(So_Menu, global.music_volume, 0)

if (!variable_global_exists("tv_state"))
{
    global.tv_state = false
}