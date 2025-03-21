if (distance_to_object(Ob_Player) > 32) 
{
    instance_destroy()
}

if (keyboard_check_pressed(vk_enter))
{
    instance_destroy()
}