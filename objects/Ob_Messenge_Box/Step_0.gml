if (!visible)
{
    return
}

switch (state)
{
    case "move_down":
        if (y < target_y)
		{
            y += speed
        }
		else 
		{
            y = target_y
            state = "stopped"
            message_timer = message_stop_time
        }
        break

    case "stopped":
        if (message_timer > 0) 
		{
            message_timer -= 0.7
        } 
		else
		{
            state = "move_up"
        }
        break

    case "move_up":
        if (y > -50)
		{
            y -= speed
        }
		else
		{
            if (variable_global_exists("message_count"))
			{
                global.message_count -= 1
            }
            instance_destroy()
        }
        break
}