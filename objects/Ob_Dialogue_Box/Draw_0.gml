draw_set_color(c_white)

draw_rectangle_color(x - 100, y + 50, x + 100, y + 100, c_black, c_black, c_black, c_black, false)

if (trigger != noone)
{
    draw_text(x, y + 60, trigger.dialog_text)
}

draw_set_color(c_white)