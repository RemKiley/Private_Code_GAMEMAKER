function StartBlinking()
{
    if (!tv_on && !blink_done)
	{
        blinking = true;
        blink_time = 0;  
    }
}