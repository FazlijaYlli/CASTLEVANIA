// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Hit(){
	
	
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
		hp -= 1;
		
		if(!audio_is_playing(sndEnemyHit))
		{
			audio_play_sound(sndEnemyHit,0,false);
		}
		
		if(hp > 0)
		{	
			alarm[0] = room_speed / 3;
			canBeHit = false;
			hSpeed += 5 * -sign(oPlayer.image_xscale);
			vSpeed -= 2;
		}
	}

	#region Mouvement & Collisions
	//Horizontal Movement 
	hSpeed = move * wSpeed;
	//Vertical Movement 
	vSpeed = vSpeed + gravForce;
	
	
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
	
	if (image_xscale != -move) 
	{
		image_xscale = -move;
	}
	
	#endregion Mouvement & Collisions

	x += hSpeed
	y += vSpeed;
}