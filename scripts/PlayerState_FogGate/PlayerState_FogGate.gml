function PlayerState_FogGate(){
	global.isBossMet = true;
	sprite_index = sSimonWalk;
	invincible = true;
	image_speed = 0.5;
	mask_index=sSimonStairsUpHB;
	if(place_meeting(x,y,oDoor))
	{
		x += 0.5*-image_xscale;
		if(!audio_is_playing(sndFogDoor))
		{
			audio_play_sound(sndFogDoor,0,false);	
		}
	}
	else
	{
		invincible = false;
		state = PLAYERSTATE.MOVING;	
	}
	mask_index=sSimonIdle;
	//x += (sprite_get_width(oPlayer)) * -image_xscale;
}