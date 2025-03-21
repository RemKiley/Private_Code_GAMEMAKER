function level_restart()
{
    if (global.current_level != undefined)
    {
        room_goto(global.current_level)
    }
    else
    {
        room_restart()
    }
}