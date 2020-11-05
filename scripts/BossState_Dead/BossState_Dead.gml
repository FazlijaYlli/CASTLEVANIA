// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function BossState_Dead(){
	if(alarm[1] == -1)
	{
		alarm[1] = room_speed * 5;
		sprite_index = sBossIdle;
	}
	else
	{
		if(alarm[1] == 0)
		{
			alarm[1] = -1;
			instance_destroy();
		}
		else if (alarm[1] % 20 == 0)
		{
			instance_create_layer(x+irandom_range(-10,10),y+irandom_range(-10,10),"Level",oHitEffect);
			audio_play_sound(sndEnemyDeath,0,false);
			randomize();
		}
	}
}