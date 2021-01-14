// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function EnemyState_Chase(){
	
	if(alarm[1] == -1)
	{
		alarm[1] = reactTime;
	}
	
	//Horizontal Movement 
	hSpeed = move * wSpeed;
	//Vertical Movement 
	vSpeed = vSpeed + gravForce;

	//Turning the sprites when going in opposite direction.
	if (image_xscale != -move) 
	{
		image_xscale = -move;
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
	
	//Hitting the player
	if(place_meeting(x,y,oPlayer))
	{
		with(oPlayer)
		{
			if(!invincible and hp > 0)
			{
				state = PLAYERSTATE.HIT;
				hp -= oEnemy.damage;
			}
		}
	}
	
	if(distance_to_object(oPlayer) > detectionRadius)
	{
		state = ENEMYSTATE.MOVING;	
	}
}