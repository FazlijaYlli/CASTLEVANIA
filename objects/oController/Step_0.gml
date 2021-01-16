if (alarm[0] == -1 and alarm[1] == -1)
{
	with(oPlayer)
	{
		if(dead)
		{
			with(oController)
			{
				dyingCinematic = true;	
			}
		}
	}
	
	if(dyingCinematic)
	{
		alarm[0] = 5*room_speed;
		alarm[1] = 6*room_speed;
		dyingCinematic = false;
	}
}

if(keyboard_check_pressed(ord("R")))
{
	room_restart();
}

if(keyboard_check_pressed(vk_f11))
{
	if (window_get_fullscreen()) {
	    window_set_fullscreen(false);
	}
	else
	{
		window_set_fullscreen(true);		
	}
}

