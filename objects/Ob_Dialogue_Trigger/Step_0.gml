if (global.game_paused)
{
	exit
}

if (distance_to_object(Ob_Player) < 32)
{
    show_arrow = true
    if (keyboard_check_pressed(vk_up))
    {
        var box = instance_create_layer(x, y, "Instances_3", Ob_Dialogue_Box)
        box.trigger = id
    }
}
else
{
    show_arrow = false
}