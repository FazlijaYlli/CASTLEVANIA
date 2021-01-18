// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Moving(){
	
	//Choose a direction when the bossfights begins.
	if(move = 0 and global.isBossMet)
	{
		move = choose(1, -1);
	}

	//Speed of the boss is determined by the number of hits he has taken.
	//The augment in speed is linear.
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

	//Play his music.
	if(global.isBossMet)
	{
		if(!audio_is_playing(musSkeletonLords))
		{
			audio_stop_all();
			audio_play_sound(musSkeletonLords,0,false);
		}
	}
	
	//If the player dies, reset the global "isBossMet" variable.
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
	
	//If the player is in detection radius, get in chase state.
	if(distance_to_object(oPlayer) < detectionRadius)
	{
		state = ENEMYSTATE.CHASE;
	}
	
	//If the boss touches the player
	if(place_meeting(x,y,oPlayer))
	{
		with(oPlayer)
		{
			if(state != PLAYERSTATE.DEAD)
			{
				global.isBossMet = true;	
			}
			
			//If the player is not invincible and has more than 0 HP
			//Put the player in hit state and withdraw HP.
			if(!invincible and hp > 0)
			{
				state = PLAYERSTATE.HIT;
				hp -= oBoss.damage;
			}
		}
	}
}