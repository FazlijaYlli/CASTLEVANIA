// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerState_Dead(){
	sprite_index = sSimonHurt;
	dead = true;
	if(!audio_is_playing(sndDead))
	{
		audio_stop_all();
		audio_play_sound(sndDead,0,false);
	}
	if(alarm[2] = -1)
	{
		alarm[2] = room_speed * 2;
	}
}