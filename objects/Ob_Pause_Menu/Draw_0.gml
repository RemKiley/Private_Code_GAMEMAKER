var cam_x = camera_get_view_x(view_camera[0])
var cam_y = camera_get_view_y(view_camera[0])
var cam_w = camera_get_view_width(view_camera[0])
var cam_h = camera_get_view_height(view_camera[0])

draw_set_color(c_black)
draw_set_alpha(0.3)
draw_rectangle(cam_x, cam_y, cam_x + cam_w, cam_y + cam_h, false)
draw_set_alpha(1) 

var button_x = cam_x + 450
var button_y = cam_y + 200
var button_spacing = 300

draw_set_color(c_white)
for (var i = 0; i < array_length(menu_options); i++) 
{
    if (i == 0) 
	{
        draw_sprite(Sp_Button_Resume_Game_Menu_Pause, 0, button_x, button_y + i * button_spacing)
    } 
    else if (i == 1)
	{
        draw_sprite(Sp_Button_Quit_Menu_Pause, 0, button_x, button_y + i * button_spacing)
    }

    if (i == selected_option) 
	{
        draw_text(button_x - 60, button_y + i * button_spacing, ">")
    }
}