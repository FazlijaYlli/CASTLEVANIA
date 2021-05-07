// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BossState_Riposted(){
	alarm[7] = -1;
	
	if(alarm[1] == -1)
	{
		alarm[1] = room_speed;	
	}
	
	if(alarm[1] > 0)
	{	
		hSpeed = -move*5;
	
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
	}
	else 
	{
		alarm[1] = -1;
		poiseBroken = false;
		state = ENEMYSTATE.MOVING;	
	}
}