function PlayerState_Hit(){
	
	//Horizontal Movement 
	hSpeed = move * wSpeed;
	//Vertical Movement 
	vSpeed = vSpeed + gravForce;
	
	//Leave all stairs state.
	goingToStairsUp = false;
	climbingStairsUp = false;
	goingToStairsDown = false;
	climbingStairsDown = false;
	
	//Stops hSpeed if touched in the air.
	if(!place_meeting(x,y+1,oWall) and canBeHit)
	{
		vSpeed = 0;	
	}
	
	
	if (hp <= 0)
	{
		state = PLAYERSTATE.DEAD;
		if (!audio_is_playing(sndEnemyDeath)) 
		{
			audio_play_sound(sndEnemyDeath,0,false);
		}
	}
	else if (canBeHit)
	{
		if(!audio_is_playing(sndEnemyHit))
		{
			audio_play_sound(sndEnemyHit,0,false);
		}
		if(hp > 0)
		{	
			//Set two alarms
			//First for going back to move state after a short time
			//Second for the iframes of being hit.
			alarm[0] = room_speed * 0.75;
			alarm[1] = room_speed * 1.5;
			canBeHit = false;
			move = 0;
			invincible = true;
			sprite_index = sSimonHurt;
			hSpeed += 5 * image_xscale;
			vSpeed -= 3;
		}
	}
	
	#region Mouvement & Collisions
	
	
	//Horizontal Collisions
	if (place_meeting(x+hSpeed,y,oWall)) 
	{
		while(!place_meeting(x+sign(hSpeed),y,oWall)) 
		{
			x += sign(hSpeed);
		}
		move = -move;
		hSpeed = 0;
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
	
	#endregion Mouvement & Collisions
	
	x += hSpeed
	y += vSpeed;
}