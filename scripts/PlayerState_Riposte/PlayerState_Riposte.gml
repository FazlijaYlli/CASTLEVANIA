// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Riposte(){
	image_speed = 0;
	image_index = 0;
	sprite_index = sSimonAttack;
	
	if(alarm[3] == -1)
	{
		alarm[3] = riposteDuration;
	}
	else if(alarm[3] <= riposteDuration and alarm[3] > riposteDuration / 2)
	{
		image_index = 0;
	}
	else if(alarm[3] <= riposteDuration / 2 and alarm[3] > riposteDuration / 3)
	{
		image_index = 1;
	}
	else if(alarm[3] <= riposteDuration / 3 and alarm[3] > 0)
	{
		riposte = true;
		oController.shake = true;
		image_index = 2;
	}
	else if(alarm[3] == 0)
	{
		alarm[3] = -1;
		oController.shake = false;
		riposte = false;
		state = PLAYERSTATE.MOVING;
	}
}