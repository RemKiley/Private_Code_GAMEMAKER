/// @function scr_audio_get_playing()
/// @desc Возвращает ID первого найденного воспроизводимого аудио
var sounds = [So_Hub, So_Level1] //all sound BROOOOO!
for (var i = 0; i < array_length(sounds); i++) 
{
    if (audio_is_playing(sounds[i]))
	{
        return sounds[i]
    }
}
return ""