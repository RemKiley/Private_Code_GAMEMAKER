if (!variable_instance_exists(self, "fade_direction"))
{
    fade_direction = 0
}

if (fade_direction == 1)
{
    room_goto(Room_Game)
}
else if (fade_direction == -1)
{
    
    instance_destroy()
}