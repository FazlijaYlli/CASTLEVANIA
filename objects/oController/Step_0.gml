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

if(shake){
    shakeDur --;
    view_xview += choose(-shakeForce,shakeForce);
    view_yview += choose(-shakeForce,shakeForce);
    if(shakeDur <= 0){
        shake = false;
        shakeDur = 5;
    }
}else{
    view_xview = approach(view_xview,0,0.3);
    view_yview = approach(view_yview,0,0.3);
}

//If the boss doesn't exist anymore, delete the fogwall.
if(!instance_exists(oBoss))
{
	instance_destroy(oPlayer.currentDoor);
}

