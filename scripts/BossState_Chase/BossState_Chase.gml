// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BossState_Chase(){
	
	//If the player has died, go back to "moving" state.
	with(oPlayer)
	{
		if(state = PLAYERSTATE.DEAD)
		{
			oBoss.state = ENEMYSTATE.MOVING;
		}
		else //If the boss is not facing the player, face it after "reactTime".
		{
			with(oBoss)
			{
				if(move != sign(oPlayer.x - x) and alarm[2] == -1)
				{
					alarm[2] = reactTime;
				}
			}
		}
	}
	
	//Horizontal Movement 
	hSpeed = move * wSpeed;
	//Vertical Movement 
	vSpeed = vSpeed + gravForce;

	//Turning the sprites when going in opposite direction.
	if (image_xscale != -move) 
	{
		image_xscale = -move * 2;
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
				hp -= oBoss.damage;
			}
		}
	}
}