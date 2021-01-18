// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Moving(){
	
	detectionRadius = baseDetectionRadius;
	
	//Set back the speed to 0.5;
	wSpeed = 0.5;
	image_speed = 1;
	
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
		
		if(distance_to_object(oPlayer) > detectionRadius)
		{
			move = -move;	
		}
		else
		{
			hSpeed = 0;	
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

	
	//Turning back when arrives at pitfall.
	if(!place_meeting(x+sprite_get_width(sEnemyWalking)*move,y+1, oWall))
	{
		move = -move;
	}
	
	//If the player is IN the detection radius go to chase state.
	if(distance_to_object(oPlayer) < detectionRadius)
	{
		state = ENEMYSTATE.CHASE;
	}
}