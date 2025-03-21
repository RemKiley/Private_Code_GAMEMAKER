if (!variable_global_exists("tv_state"))  
{
    global.tv_state = false
}

if (global.tv_state) 
{
    if (mouse_check_button_pressed(mb_left) && point_in_rectangle(mouse_x, mouse_y, x - sprite_width / 2, y - sprite_height / 2, x + sprite_width / 2, y + sprite_height / 2)) 
    {
        switch (action_type) 
        {
            case "START":
                room_goto(Room_Save_Selected)
                break;

            case "SETTINGS":
                global.tv_state = true;
                global.tv_blink_done = true 
                room_goto(Room_Setting)
                break

            case "EXIT":
                game_end()
                break
        }
    }
}