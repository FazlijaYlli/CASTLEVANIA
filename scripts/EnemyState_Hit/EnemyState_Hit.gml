// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Hit(){
	
	
	healthbar_show = true;
	alarm[2] = room_speed*10;
	
	showDamage = true;
	alarm[3] = room_speed*2;
	
	//Put the sprite in same direction as movement.
	if (image_xscale != -move) 
	{
		image_xscale = -move;
	}
	
	//If death, put in death state.
	if (hp <= 0)
	{
		state = ENEMYSTATE.DEAD;
		if (!audio_is_playing(sndEnemyDeath)) 
		{
			audio_play_sound(sndEnemyDeath,0,false);
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
	
		if(canBeHit)
	{		
		//Put invincibility alarm at third of a second.
		alarm[0] = room_speed / 3;
		
		//Push enemy back a bit and play hit sound.
		if(!audio_is_playing(sndEnemyHit))
		{
			audio_play_sound(sndEnemyHit,0,false);
		}
		
		//Withdraw HP.
		hp -= oPlayer.damage;
		damageCombo += oPlayer.damage;
		canBeHit = false;
	}
	
	if(alarm[0] != -1)
	{
		hSpeed *= 0.5;
	}
	
	x += hSpeed;
	y += vSpeed;
}