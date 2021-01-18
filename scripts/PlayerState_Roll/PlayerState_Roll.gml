// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Roll(){
	
	//Stamina usage
	if(canUseStamina and stamina > 0)
	{
		stamina -= rollStaminaCost;
		canUseStamina = false;
	}
 
	//iFrames for the roll. 
	if(alarm[4] == -1)
	{
		alarm[4] = rollFrames;
	}
	
	if(alarm[4] > 0) //While the alarm is ticking down.
	{
		//Sprite and invincible.
		sprite_index = sSimonRoll;
		invincible = true;
		
		//Set the hSpeed
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
	else if (alarm[4] == 0) //Stops the roll once an alarm is finished.
	{
		alarm[4] = -1;
		invincible = false;
		state = PLAYERSTATE.MOVING;
	}
}