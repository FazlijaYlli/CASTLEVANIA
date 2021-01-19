// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Hit(){
	
	showDamage = true;
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
		//Withdraw HP.
		hp -= oPlayer.damage;
		damageCombo += oPlayer.damage;
		hitsTaken += 1;
		//Speed up the image speed
		image_speed = 1 + (hitsTaken/2);
		
		if(!audio_is_playing(sndEnemyHit))
		{
			audio_play_sound(sndEnemyHit,0,false);
		}
		
		if(hp > 0)
		{	
			//Start the invincibility alarm, which is 0.3s.
			alarm[0] = room_speed / 3;
			canBeHit = false;
			
			//Push back the boss in the opposite direction of the player.
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
	
	if(hp > 0 and image_xscale != -move)
	{
		image_xscale = -move * 2;
	}
	
	#endregion Mouvement & Collisions

	x += hSpeed
	y += vSpeed;
}