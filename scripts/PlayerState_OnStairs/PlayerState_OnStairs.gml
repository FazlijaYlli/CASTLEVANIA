 function PlayerState_OnStairs(){
	if(goingToStairsUp)
	{
		//Where the player should end up after the movement.
		sprite_index = sSimonWalk;
		
		targetX = currentStair.x - ((sprite_get_width(sSimonIdle) / 2) * currentStair.image_xscale);
		
		//Make player turn to stair if he is not facing them.
		image_xscale = currentStair.image_xscale;

		//Snap our player to the front of the stairs.
		x = targetX;
		hSpeed = 0;
		image_xscale = -currentStair.image_xscale;
		image_index = 0;
		sprite_index = sSimonStairsAscend;
		y -= 2;
		//When player is in good position, put him in climbing stairs up state.
		goingToStairsUp = false;
		climbingStairsUp = true;
	}
	else if (climbingStairsUp)
	{
		move = -image_xscale;
		//If the up key is pressed
		if(keyUp)
		{
			//Go in the direction of the stairs xscale.
			image_speed = 1;
			image_xscale = -currentStair.image_xscale;
			//Put the sprite.
			if(sprite_index != sSimonStairsAscend)
			{
				sprite_index = sSimonStairsAscend;
			}
			
			//Go at half speed in diagonal.
			x += (wSpeed * 0.5) * move;
			y -= (wSpeed * 0.5);
			
			//Check if there is another stair in front of him.
			mask_index = sSimonStairsUpHB;
			if(!place_meeting(x,y,oStairs))
			{
				//If not, go back to moving.
				state = PLAYERSTATE.MOVING;
				climbingStairsUp = false;
			}
			mask_index = sSimonIdle;
		}
		else if(keyCrouch)
		{
			//If we touch a wall below
			if(place_meeting(x,y+(wSpeed*0.5),oWall))
			{
				state = PLAYERSTATE.MOVING;
				climbingStairsUp = false;
			}
			else //Go down in diagonal.
			{
				image_speed = 1;
				image_xscale = currentStair.image_xscale;
				if(sprite_index != sSimonStairsDescend)
				{
					sprite_index = sSimonStairsDescend;
				}
				x += (wSpeed * 0.5) * move;
				y += (wSpeed * 0.5);
			}
		}
		else if(keyAttack)
		{
			state = PLAYERSTATE.STAIR_ATTACK;
		}
		else //If the player is not moving, stop sprite.
		{
			image_speed = 0;	
			image_index = 0;
		}
	}
	if(goingToStairsDown)
	{
		//Where the player should end up after the movement.
		sprite_index = sSimonWalk;
		targetX = currentStair.x;
		
		//Make player turn to stair if he is not facing them.
		image_xscale = currentStair.image_xscale;
		
		//Snap our player to the front of the stairs.
		x = targetX;
		hSpeed = 0;
		vSpeed = 0;
		image_index = 0;
		image_xscale = currentStair.image_xscale;
		sprite_index = sSimonStairsDescend;
		y += 5;
		goingToStairsDown = false;
		climbingStairsDown = true;
	}
	else if (climbingStairsDown) //Almost the exact same code as climbingStairsUp, except for a few differences.
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
			x -= (wSpeed * 0.5) * image_xscale;
			y -= (wSpeed * 0.5);
			mask_index = sSimonStairsUpHB;
			if(!place_meeting(x,y,oStairs))
			{
				state = PLAYERSTATE.MOVING;
				climbingStairsDown = false;
			}
			mask_index = sSimonIdle;
		}
		else if(keyCrouch)
		{
			if(place_meeting(x,y+2,oWall))
			{
				state = PLAYERSTATE.MOVING;	
				climbingStairsDown = false;
			}
			else
			{
				image_speed = 1;
				image_xscale = currentStair.image_xscale;
				if(sprite_index != sSimonStairsDescend)
				{
					sprite_index = sSimonStairsDescend;
				}
				x -= (wSpeed * 0.5) * image_xscale;
				y += (wSpeed * 0.5);
			}
		}
		else if(keyAttack)
		{
			state = PLAYERSTATE.STAIR_ATTACK;
		}
		else
		{
			image_speed = 0;	
			image_index = 0;
		}
	}
}