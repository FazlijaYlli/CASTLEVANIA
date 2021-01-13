// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Moving(){
	
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
		move = -move;
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
}