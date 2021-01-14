// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Moving(){

	if(move = 0 and global.isBossMet)
	{
		move = choose(1, -1);
	}

	wSpeed = wSpeedBase * (hitsTaken/3) + wSpeedBase;
	
	//Horizontal Movement 
	hSpeed = move * wSpeed;
	//Vertical Movement 
	vSpeed = vSpeed + gravForce;

	//Turning the sprites when going in opposite direction.
	if (image_xscale != -move) 
	{
		image_xscale = -move * 2;
	}
	
	//Horizontal Collisions
	if (place_meeting(x+hSpeed,y,oWall)) 
	{
		while(!place_meeting(x+sign(hSpeed),y,oWall)) 
		{
			x += sign(hSpeed);
		}
			move = -move; 
	}

	x += hSpeed;

	//Vertical Collisions
	if (place_meeting(x,y+vSpeed,oWall)) 
	{
		while(!place_meeting(x,y+sign(vSpeed),oWall)) 
		{
			y += sign(vSpeed);
		}
		vSpeed = 0;
	}
	
	y += vSpeed;

	if(global.isBossMet)
	{
		if(!audio_is_playing(musSkeletonLords))
		{
			audio_stop_all();
			audio_play_sound(musSkeletonLords,0,false);
		}
	}
	
	with(oPlayer)
	{
		if(state = PLAYERSTATE.DEAD)
		{
			global.isBossMet = false;
		}
	}
	
	//Turning back when arrives at pitfall.
	if(!place_meeting(x+sprite_get_width(sBossWalking)*move,y+1, oWall))
	{
		move = -move;
	}
	
	if(distance_to_object(oPlayer) < detectionRadius)
	{
		state = ENEMYSTATE.CHASE;
	}

}