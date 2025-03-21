function show_message_box(message_text)
{
    if (global.message_count < 3)
	{ 
        var msg_box = instance_create_layer(0, -50, "Instances", Ob_Messenge_Box)
        msg_box.message_text = message_text 
        global.message_count += 1
    }
}
