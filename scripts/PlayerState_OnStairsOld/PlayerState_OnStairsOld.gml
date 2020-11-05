function PlayerState_OnStairsOld(){
	if(goingToStairsUp)
	{
		//Where the player should end up after the movement.
		sprite_index = sSimonWalk;
		targetX = currentStair.x - (sprite_get_width(sSimonIdle) * currentStair.image_xscale);
		
		//Make player turn to stair if he is not facing them.
		image_xscale = currentStair.image_xscale;
		
		//Direction of the movement (1 = right, -1 = left)
		move = sign(targetX - x);
		//If player position isn't in front of the stairs
		if(x != targetX)
		{
			//Calculating our horizontal speed
			hSpeed = wSpeed * move;
		
			//If we are going to the right
			if(move == 1)
			{
				//If player's position + his speed IS LOWER THAN our target position AND If player's position + his speed IS GREATER THAN our target position - 1px
				//This for when there is less than 1 pixel between our player position and the snap point in front of the stairs.
				if(x + hspeed < targetX and x + hspeed > targetX-1)
				{
					//Snap our player to the front of the stairs.
					x = targetX;
					hSpeed = 0;
					image_xscale = -currentStair.image_xscale;
					image_index = 0;
					sprite_index = sSimonStairsAscend;
					x += (sprite_get_width(sSimonIdle) / 2) * currentStair.image_xscale;
					y -= 2;
					goingToStairsUp = false;
					climbingStairsUp = true;
				}
			}
			else //Same here for when the player goes left instead of right.
			{
				if(x + hspeed > targetX and x + hspeed < targetX+1)
				{
					x = targetX;
					hSpeed = 0;
					image_xscale = -currentStair.image_xscale;
					image_index = 0;
					sprite_index = sSimonStairsAscend;
					x += (sprite_get_width(sSimonIdle) / 2) * currentStair.image_xscale;
					y -= 2;
					goingToStairsUp = false;
					climbingStairsUp = true;
				}	
			}
		}
		x += hSpeed;
	}
	else if (climbingStairsUp)
	{
		move = -image_xscale;
		if(keyUp)
		{
			image_speed = 1;
			image_xscale = -currentStair.image_xscale;
			if(sprite_index != sSimonStairsAscend)
			{
				sprite_index = sSimonStairsAscend;
			}
			x += 0.75 * move;
			y -= 0.75;
			if(!place_meeting(x+(sprite_get_width(sSimonIdle)/2)*move,y,oStairs))
			{
				state = PLAYERSTATE.MOVING;
				climbingStairsUp = false;
			}
		}
		else if(keyCrouch)
		{
			if(place_meeting(x,y+2,oWall))
			{
				state = PLAYERSTATE.MOVING;	
				climbingStairsUp = false;
			}
			else
			{
				image_speed = 1;
				image_xscale = currentStair.image_xscale;
				if(sprite_index != sSimonStairsDescend)
				{
					sprite_index = sSimonStairsDescend;
				}
				x += 0.75 * move;
				y += 0.75;
			}
		}
		else
		{
			image_speed = 0;	
		}
	}
	if(goingToStairsDown)
	{
		//Where the player should end up after the movement.
		sprite_index = sSimonWalk;
		targetX = currentStair.x;
		move = sign(targetX - x);
		
		image_xscale = currentStair.image_xscale;
		
		if (x != targetX)
		{
			hSpeed = wSpeed * move;
			
			if(move == 1)
			{
				//This for when there is less than 1 pixel between our player position and the snap point in front of the stairs.
				if(x + hspeed < targetX and x + hspeed > targetX-1)
				{
					//Snap our player to the front of the stairs.
					x = targetX;
					hSpeed = 0;
					vSpeed = 0;
					image_index = 0;
					image_xscale = currentStair.image_xscale;
					sprite_index = sSimonStairsDescend;
					goingToStairsDown = false;
					climbingStairsDown = true;
				}
			}
			else //Same here for when the player goes left instead of right.
			{
				if(x + hspeed > targetX and x + hspeed < targetX+1)
				{
					x = targetX;
					hSpeed = 0;
					vSpeed = 0;
					image_index = 0;
					image_xscale = currentStair.image_xscale;
					sprite_index = sSimonStairsDescend;
					goingToStairsDown = false;
					climbingStairsDown = true;
				}	
			}
		}
		x += hSpeed;
	}
	else if (climbingStairsDown)
	{
		move = -image_xscale;
		if(keyUp)
		{
			image_speed = 1;
			image_xscale = -currentStair.image_xscale;
			if(sprite_index != sSimonStairsAscend)
			{
				sprite_index = sSimonStairsAscend;
			}
			x -= 0.75 * image_xscale;
			y -= 0.75;
		}
		else if(keyCrouch)
		{
			if(place_meeting(x,y+2,oWall))
			{
				state = PLAYERSTATE.MOVING;	
				climbingStairsDown = false;
			}
			{
				image_speed = 1;
				image_xscale = currentStair.image_xscale;
				if(sprite_index != sSimonStairsDescend)
				{
					sprite_index = sSimonStairsDescend;
				}
				x -= 0.75 * image_xscale;
				y += 0.75;
			}
		}
		else
		{
			image_speed = 0;	
		}
	}
}