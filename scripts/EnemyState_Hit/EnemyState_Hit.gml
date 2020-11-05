// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Hit(){
	
	
	if (image_xscale != -move) 
	{
		image_xscale = -move;
	}
	
	if (hp <= 0)
	{
		state = ENEMYSTATE.DEAD;
		if (!audio_is_playing(sndEnemyDeath)) 
		{
			audio_play_sound(sndEnemyDeath,0,false);
		}
	}
	
	if(canBeHit)
	{
		if(sign(image_xscale) == sign(oPlayer.image_xscale))
		{
			move = -move;
		}
		
		alarm[0] = room_speed / 3;
		
		hSpeed += 5 * -sign(oPlayer.image_xscale);
		vSpeed -= 2;
		if(!audio_is_playing(sndEnemyHit))
		{
			audio_play_sound(sndEnemyHit,0,false);
		}
		hp -= 1;
		canBeHit = false;
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
	
	#endregion Mouvement & Collisions
	
	x += hSpeed
	y += vSpeed;
}