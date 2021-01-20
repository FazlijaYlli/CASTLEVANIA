// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BossState_Charge(){
	
	if (alarm[5] == -1)
	{
		alarm[5] = room_speed*3;	
	}
	else if(alarm[5] > room_speed and alarm[5] <= room_speed*3)
	{
		image_speed = 5;
		hyperarmor = true;
		hSpeed = 0.1 * image_xscale;	
	}
	else if(alarm[5] <= room_speed and alarm[5] > 0)
	{
		image_speed = 12;
		wSpeed = 3;
		hSpeed = 2 * -image_xscale;
		image_xscale = -move * 2;
	}
	else if(alarm[5] == 0)
	{
		hyperarmor = false;
		state = ENEMYSTATE.MOVING;	
	}
	
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
		if(alarm[5] <= room_speed and alarm[5] > 0)
		{
			alarm[5] = 0;
			state = ENEMYSTATE.MOVING();
			hyperarmor = false;	
		}
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
				hp -= oBoss.damage * 2;
			}
		}
	}
}