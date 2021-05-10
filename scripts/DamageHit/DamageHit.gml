// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function DamageHit(damage, stagger, iTime){
	healthbar_show = true;
	alarm[2] = room_speed*10;
	
	showDamage = true;
	alarm[3] = room_speed*2;
	
	
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
		alarm[0] = room_speed / argument2;
		
		if(state != ENEMYSTATE.DEAD)
		{
			//Withdraw HP.
			hp -= argument0;
			damageCombo += argument0;
			state = ENEMYSTATE.HIT;
			
			//Push enemy back a bit and play hit sound.
			if(!audio_is_playing(sndEnemyHit))
			{
				audio_play_sound(sndEnemyHit,0,false);
			}
			
			if(alarm[0] != -1)
			{
				hSpeed *= argument1;
			}
		}
	}
}