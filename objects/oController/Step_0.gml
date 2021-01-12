if (alarm[0] == -1)
{
	with(oPlayer)
	{
		if(dead)
		{
			with(oController)
			{
				restartCinematic = true;	
			}
		}
	}
	
	if(restartCinematic)
	{
		alarm[0] = 5*room_speed;
		alarm[1] = 6*room_speed;
		restartCinematic = false;
	}
}

if(keyboard_check_pressed(ord("R")))
{
	room_restart();
}

