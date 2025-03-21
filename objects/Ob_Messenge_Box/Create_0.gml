message_text = ""
target_y = 50
message_stop_time = 60
message_timer = 0
speed = 5
state = "move_down"
visible = false

if (!variable_global_exists("message_count"))
{
    global.message_count = 0
}