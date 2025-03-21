if (visible)
{
    draw_set_color(c_black)
    draw_rectangle(x - 150, y - 25, x + 150, y + 25, false)
    draw_set_color(c_white)
    if (message_text != "")
	{
        draw_text(x - string_width(message_text) / 100, y - 12, message_text)
    } 
	else
	{
        show_debug_message("Ошибка: Пустой message_text при рисовании!")
    }
}