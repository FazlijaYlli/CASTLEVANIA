// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Dead(){
	//Setting up the death cinematic to 3 seconds.
	if(alarm[1] == -1)
	{
		alarm[1] = room_speed * 3;
		sprite_index = sBossIdle;
	}
	else //While the alarm is ticking down
	{
		if(alarm[1] == 0) //If the alarm finished ticking down
		{
			alarm[1] = -1;
			global.isBossMet = false;
			instance_destroy(); //Destroy the boss instance.
		}
		else if (alarm[1] % 10 == 0) //Every tenth of a second
		{
			//Create an effect at a random coordinates on the boss sprite.
			instance_create_layer(x+irandom_range(-sprite_get_width(sEnemyidle),sprite_get_width(sEnemyidle)),y+irandom_range(-sprite_get_height(sEnemyidle),sprite_get_height(sEnemyidle)),"Level",oHitEffect);
			audio_play_sound(sndEnemyDeath,0,false);
			randomize();
		}
	}
}