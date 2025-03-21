if (global.player_spawn_x == 0 && global.player_spawn_y == 0)
{
    global.player_spawn_x = 100
    global.player_spawn_y = 300
}

if (instance_exists(Ob_Player)) {
    Ob_Player.x = global.player_spawn_x;
    Ob_Player.y = global.player_spawn_y;
}

var music_data = ds_map_find_value(global.room_music_map, room);
var new_music = (music_data != undefined) ? music_data[0] : -1;
var reset_music = (music_data != undefined) ? music_data[1] : false;

if (new_music != -1) {
    if (global.current_music != new_music) {
        if (global.current_music != -1 && audio_is_playing(global.current_music)) {
            audio_stop_sound(global.current_music);
        }
        global.current_music = audio_play_sound(new_music, 1, true);
    } else if (!reset_music && audio_is_playing(global.current_music)) {
        audio_sound_set_track_position(global.current_music, global.music_position);
    }
    audio_sound_gain(global.current_music, global.music_volume, 0);
}
