slider_position = global.music_volume * slider_width

draw_set_color(c_white)
draw_text(slider_x - 55 , slider_y - 11, "MUSIC")
draw_rectangle(slider_x, slider_y - 5, slider_x + slider_width, slider_y + 5, false)
draw_circle(slider_x + slider_position, slider_y, 10, false)