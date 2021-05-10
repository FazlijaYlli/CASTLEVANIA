// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Hit(){
	
	if(!poiseBroken)
	{
		//Horizontal Movement 
		//hSpeed = move * wSpeed;
		//Vertical Movement 
		vSpeed = vSpeed + gravForce;
	
		showDamage = true;
	
		//Set the time when the damage dissappear.
		alarm[3] = room_speed*2;
		
		if (hp <= 0)
		{
			state = ENEMYSTATE.DEAD;
			if (!audio_is_playing(sndEnemyDeath)) 
			{
				audio_play_sound(sndEnemyDeath,0,false);
			}
		}
		else if (canBeHit)
		{	
			//If the boss is hit during a charge, he will be poise broken.
			if(alarm[5] <= room_speed and alarm[5] > 0 and hyperarmor = true)
			{
				//canBeHit = false;
				state = ENEMYSTATE.POISE_BROKEN;	
				poiseBroken = true;
			}	
			else
			{
				alarm[5] = -1;
				state = ENEMYSTATE.MOVING;	
			}
			
			if(hp > 0 and alarm[5] == -1)
			{	
				//Start the invincibility alarm, which is 0.1666s.
				alarm[0] = room_speed / 6;
				canBeHit = false;
			}
			
		    if(state != ENEMYSTATE.DEAD)
			{
				canBeHit = false;
				hitsTaken += 1;
			}

		
			if(!audio_is_playing(sndEnemyHit))
			{
				audio_play_sound(sndEnemyHit,0,false);
			}
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

		//Vertical Collisions
		if (place_meeting(x,y+vSpeed,oWall)) 
		{
			while(!place_meeting(x,y+sign(vSpeed),oWall)) 
			{
				y += sign(vSpeed);
			}
			vSpeed = 0;
		}
	
		if(hp > 0 and image_xscale != -move)
		{
			image_xscale = -move * 2;
		}
	
		if(state != ENEMYSTATE.POISE_BROKEN)
		{
			x += hSpeed
			y += vSpeed;
		}
	}
	else
	{
		canBeHit = true;
		poiseBroken = false;
		//Reset charge alarm
		alarm[5] = -1;
		state = ENEMYSTATE.MOVING;	
	}
}
