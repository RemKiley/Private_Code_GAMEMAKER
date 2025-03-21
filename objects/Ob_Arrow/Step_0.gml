if (instance_exists(Ob_Player)) 
{
    x = Ob_Player.x
    y = Ob_Player.y - 75
}
else 
{
    instance_destroy()
}

if (place_meeting(Ob_Player.x, Ob_Player.y, Ob_Door)) 
{
    image_alpha = min(image_alpha + 0.05, 1);
}
else 
{
    image_alpha = max(image_alpha - 0.05, 0);
    if (image_alpha == 0) 
    {
        instance_destroy()
    }
}