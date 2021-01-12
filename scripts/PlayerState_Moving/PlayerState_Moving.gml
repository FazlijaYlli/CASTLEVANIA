function PlayerState_Moving(){
	
	//Direction
	//move will equal 1 with going to the right, -1 going to the left and 0 if standing still or rpessing both directions.
	move = keyRight - keyLeft;
	
	//instance_destroy(oMenu);
	
	//Update crouching.
	if(keyCrouch) 
	{ 
		crouch = true; 
	}
	else 
	{ 
		crouch = false; 
	}
	
	image_speed = 1;
	
	//IF STANDING
	if(!crouch or crouch and !place_meeting(x,y+1,oWall))
	{
		//If direction is changed and sprite inversion is not already applied, apply it.
		if (move != 0 and image_xscale != -move) 
		{
			image_xscale = -move;
		}
		else if (move == 0 and sprite_index != sSimonIdle) // Apply idle skin if not moving.
		{
			sprite_index = sSimonIdle;
		}
		
		//Horizontal Movement
		hSpeed = move * wSpeed;
		//Vertical Movement
		vSpeed = vSpeed + gravForce;

		//If touching the ground.
		if (place_meeting(x,y+1,oWall)) 
		{
			//If the jump key is pressed, jump.
			if(keyJump)
			{
				vSpeed = -jumpHeight;
			}
			//If going in either direction, apply the walk sprite.
			if(move != 0 and sprite_index != sSimonWalk)
			{
				sprite_index = sSimonWalk;	
			}
			//If there are stairs, go up on them.
			if(keyUp)
			{
				mask_index = sSimonStairsUpHB;
				if (place_meeting(x,y,oStairs))
				{
					currentStair = instance_place(x,y,oStairs);
					goingToStairsUp = true;
					state = PLAYERSTATE.ON_STAIRS;
				}
				mask_index = sSimonIdle;
			}
		}
		//If the player doesn't have any ground below him, apply the jump sprite
		else if (sprite_index != sSimonJump)
		{
			sprite_index = sSimonJump;
		}
	}
	else //If player is on the ground and using the crouch key, he can crouch
	{
		mask_index = sSimonStairsDownHB;
		if (place_meeting(x,y,oStairs))
		{
			currentStair = instance_place(x,y+1,oStairs);
			goingToStairsDown = true;
			state = PLAYERSTATE.ON_STAIRS;
			mask_index = sSimonIdle;
		}
		else
		{
			mask_index = sSimonIdle;
			sprite_index = sSimonCrouch;
			hSpeed = 0;
			vSpeed = 0;
		}
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

	
	//Going to crouch attack state if attack key is hit while crouching.
	if (keyAttack and crouch and place_meeting(x,y+1,oWall))
	{
		state = PLAYERSTATE.CROUCH_ATTACK;
	}
	else if (keyAttack)//Attacking normally while standing.
	{
		mask_index = sSimonIdle;
		sprite_index = sSimonIdle;
		state = PLAYERSTATE.ATTACK;
	}
	
	//If the Interact key is pressed.
	if(keyInteract)
	{
		if(!global.isBossMet)
		{
			mask_index = sSimonStairsUpHB;
			if(place_meeting(x,y,oDoor))
			{
				currentDoor = instance_place(x,y,oDoor);
				state = PLAYERSTATE.FOG_GATE;
			}
			mask_index = sSimonIdle;
		}
		mask_index = sSimonStairsUpHB;
		if(place_meeting(x,y,oBonfire) and place_meeting(x,y+1,oWall))
		{
			state = PLAYERSTATE.BONFIRE;
		}
		mask_index = sSimonIdle;
	}
	
	if(!instance_exists(oBoss))
	{
		instance_destroy(currentDoor);
	}
}

