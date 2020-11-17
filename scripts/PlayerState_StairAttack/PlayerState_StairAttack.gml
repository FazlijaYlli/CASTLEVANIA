// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function PlayerState_StairAttack(){
	
	if(sprite_index == sSimonStairsAscend)
	{
		sprite_index = sSimonStairsAscendAttack;
		mask_index = sSimonStairsAscendAttackHB;
		image_index = 0;
	}
	else if(sprite_index = sSimonStairsDescend)
	{
		sprite_index = sSimonStairsDescendAttack;
		mask_index = sSimonStairsDescendAttackHB;
		image_index = 0;
	}
	
	if(sprite_index = sSimonStairsAscendAttack)
	{
		mask_index = sSimonStairsAscendAttackHB;
	}
	else if(sprite_index = sSimonStairsDescendAttack)
	{
		mask_index = sSimonStairsDescendAttackHB;	
	}
	
	
	image_speed = 1;
	ds_list_clear(hitList);
	
	var frameHits = ds_list_create();
	var hits = instance_place_list(x,y,oEnemy,frameHits,false);
	
	if(audioCanPlay	and image_index > 2)
	{
		audio_play_sound(sndWhip,0,false);
		audioCanPlay = false;
	}
		
	//If we touched anything
	if (hits > 0)
	{
		//Loop for each enemy touched this frame
		for(var i = 0; i < hits; i++)
		{
			//If the instance touched hasn't yet been hit by this attack this frame
			//Check if he hasn't been hit beforehand (Check in DSLIST)
			var hitID = ds_list_find_value(frameHits, i);
			if (ds_list_find_index(hitList, hitID) == -1)
			{
				//If it wasn't touched before, add it to the list and do whatever you want to the instance.
				ds_list_add(hitList, hitID);
				with (hitID)
				{
					//Whatever happens to the enemy
					if(hp >= 1)
					{
						state = ENEMYSTATE.HIT;
					}
				}
			}
		}
	}
		
	//Reset the DSLIST for this exact step. Not the one for the entire attack.
	ds_list_destroy(frameHits);
	//Change back the mask to idle stat so Simon doesn't get send to the void.
	mask_index = sSimonIdle;
	
	if (animation_end())
	{
		audioCanPlay = true;
		if(sprite_index = sSimonStairsAscendAttack)
		{
			sprite_index = sSimonStairsAscend;
		}
		else if(sprite_index = sSimonStairsDescendAttack)
		{
			sprite_index = sSimonStairsDescend;
		}
		state = PLAYERSTATE.ON_STAIRS;
	}
}