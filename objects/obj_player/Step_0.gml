// basics input
if (keyboard_check_direct(vk_left))
{
	x -= 5;	
}

if (keyboard_check_direct(vk_right))
{
	x += 5;	
}

if (keyboard_check_direct(vk_up))
{
	y -= 5;	
}

if (keyboard_check_direct(vk_down))
{
	y += 5;	
}

// run our state machine based off of our mode

if (current_step_time <= step_time)
current_step_time += 1;

if (current_step_time == step_time)
	switch(global.mode)
	{
		case ("outdoors"):
		show_debug_message("outdoors");
		play_sound(0.5, "outdoors")
		break
	
		case ("indoors"):
		show_debug_message("indoors");
		play_sound(0.1, "indoors")
		break
	
		case ("cave"):
		show_debug_message("cave");
		play_sound(0.7, "cave")
		break
	}


if (current_step_time > step_time)
	current_step_time = 0;

