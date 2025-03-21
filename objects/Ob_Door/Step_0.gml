if (place_meeting(x, y, Ob_Player) && keyboard_check_pressed(vk_up)) 
{
    var manager = instance_find(Ob_Room_Manager, 0)
    if (target_room != noone && manager != noone)
    {
        manager.room_manager_goto(target_room, spawn_x, spawn_y)
    }
    else
    {
        show_debug_message("Ошибка: Room Manager не найден или целевая комната не указана!")
    }
}