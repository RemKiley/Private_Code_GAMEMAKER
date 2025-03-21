persistent = true

if (!variable_global_exists("player_spawn_x")) global.player_spawn_x = 0;
if (!variable_global_exists("player_spawn_y")) global.player_spawn_y = 0;
if (!variable_global_exists("current_music")) global.current_music = -1;
if (!variable_global_exists("music_volume")) global.music_volume = 0.5;
if (!variable_global_exists("music_position")) global.music_position = 0;

if (!variable_global_exists("room_music_map")) {
    global.room_music_map = ds_map_create();
    ds_map_add(global.room_music_map, Room_Game, [So_Hub, false]);
    ds_map_add(global.room_music_map, Room2, [So_Hub, false]);
    ds_map_add(global.room_music_map, Room_Title, [So_Title, true]);
    ds_map_add(global.room_music_map, Room_Title2, [So_Title, true]);
}

function room_manager_goto(target_room, spawn_x, spawn_y) {
    if (room_exists(target_room)) {
        global.player_spawn_x = spawn_x;
        global.player_spawn_y = spawn_y;
        global.last_room = room;

        if (global.current_music != -1 && audio_is_playing(global.current_music)) {
            global.music_position = audio_sound_get_track_position(global.current_music);
        }

        room_goto(target_room);
    } else {
        show_error("Ошибка: Целевая комната не существует!", true);
    }
}