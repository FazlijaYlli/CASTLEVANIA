function PlayerState_Bonfire(){
	
	//Setting Simon's sprite
	sprite_index = sSimonCrouch;
	
	if(!oBonfire.used)
	{
		mask_index = sSimonBackHB;
		if(place_meeting(x,y,oBonfire) and place_meeting(x,y+1,oWall))
		{
			image_xscale = -image_xscale;
		}
		mask_index = sSimonBackHB;
	}

	//Acivating the alarm that shows the menu two seconds after sitting.
	if(alarm[3] == -1)
	{
		alarm[3] = 2*room_speed	
	}
	
	//Healing the player
	if(hp != hpMax)
	{
		if (!isHealing)
		{
			lostHp = hpMax - hp;
			isHealing = true;
		}
		
		if(alarm[3] >= 0)
		{
			hp += lostHp / (2*room_speed);
		}
	}
	else if (hp >= hpMax)
	{
		hp = hpMax;
		isHealing = false;
	}
	
	//Playing the sound if the var "used" is false, so it doesn't play twice if the player
	//sits, leave, then sits again while the first sound is still playing.
	with(oBonfire)
	{
		if(!audio_is_playing(sndBonfireSit) and used = false)
		{
			audio_play_sound(sndBonfireSit,0,false);
		}
		else
		{
			used = true;
		}
	}
	
	//Once the third alarm is finished, create the menu.
	if(alarm[3] == 0)
	{
		
		if(!instance_exists(oMenu))
		{
			instance_create_layer(x,y,"UI",oMenu);
		}
		alarm[3] = -1;
	}	
}