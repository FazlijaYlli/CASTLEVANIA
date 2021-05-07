global.width = camera_get_view_width(view_camera[0]) * 4;
global.height = camera_get_view_height(view_camera[0]) * 4;

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

if(!instance_exists(oBoss))
{
	if(alarm[0] == -1 and !bossDefeated)
	{
		alarm[0] = 5*room_speed;
		bossDefeated = true;
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

if(global.soulsToAdd > 0)
{
	global.showSoulsAdded = true;
	AddToSouls(global.soulsToAdd);
}

var cam = view_camera[0]

//Screenshake :
if(shake > 0)
{
	shakeI++;
	
	camx = camera_get_view_x(cam);
	camy = camera_get_view_y(cam);
	
	if(shakeI % 2 == 0)
	{
		camx += random_range(-shake,shake);
		camy += random_range(-shake,shake);
		camera_set_view_pos(cam,camx,camy);
	}
	else
	{
		camera_set_view_pos(cam,oPlayer.x-camera_get_view_width(cam)/2,338);	
	}

	shake *= .9;

	if (shake < .25)
	{
		shake = 0;
	}
}
else
{
	//Camera following the player
	camera_set_view_pos(cam,oPlayer.x-camera_get_view_width(cam)/2,338);	
}


//If the boss doesn't exist anymore, delete the fogwall.
if(!instance_exists(oBoss))
{
	instance_destroy(oPlayer.currentDoor);
}

