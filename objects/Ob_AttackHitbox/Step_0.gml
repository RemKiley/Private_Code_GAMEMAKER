var enemy = instance_place(x, y, Ob_Enemy)
if (enemy != noone) 
{
    with (enemy)
    {
        instance_destroy()
    }
}

if (!instance_exists(Ob_Player) || !Ob_Player.attack) 
{
    instance_destroy()
}
//debag
if (enemy != noone)
{
    show_debug_message("Враг найден!")
}
else
{
    show_debug_message("Врагов нет!")
}