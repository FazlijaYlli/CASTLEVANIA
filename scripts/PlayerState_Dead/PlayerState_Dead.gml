// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dead(){
	//Set the "hurt" sprite until the alarm sets it to "invisible".
	if (sprite_index != sSimonInvisible)
	{
		sprite_index = sSimonHurt;	
	}
	
	dead = true;
	//Play death sound.
	if(!audio_is_playing(sndDead))
	{
		if(!audio_is_playing(sndEnemyDeath))
		{
			audio_stop_all();
			audio_play_sound(sndDead,0,false);
		}
	}
	//Time before instance gets invisible.
	if(alarm[2] = -1)
	{
		alarm[2] = room_speed * 2;
	}
}