// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Sprint(){
	if(keySprint and stamina > 0 )
	{
		if(keyRight or keyLeft)
		{
			//Horizontal Movement
			hSpeed = move * sprintSpeed;
			//Vertical Movement
			vSpeed = vSpeed + gravForce;
		
			image_speed = 2;
			stamina -= 0.5;
		}
		else
		{
			state = PLAYERSTATE.MOVING;	
		}
	
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
	else
	{
		state = PLAYERSTATE.MOVING;	
	}
}