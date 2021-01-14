// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Roll(){
	
	if(alarm[4] == -1)
	{
		alarm[4] = 25;
	}
	
	if(alarm[4] > 0)
	{
		sprite_index = sSimonRoll;
		invincible = true;
		
		//Horizontal Movement
		hSpeed = move * rollSpeed;
	
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
	}
	else if (alarm[4] == 0)
	{
		alarm[4] = -1;
		invincible = false;
		state = PLAYERSTATE.MOVING;
	}
}