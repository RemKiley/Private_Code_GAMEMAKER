if (place_meeting(x, y, Ob_Player) && instance_exists(Ob_Room_Manager))
{
    var manager = instance_find(Ob_Room_Manager, 0)
    if (target_room != noone && manager != noone)
    {
        manager.room_manager_goto(target_room, spawn_x, spawn_y)
    }
}