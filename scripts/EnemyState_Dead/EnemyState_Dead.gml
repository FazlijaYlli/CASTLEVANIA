// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Dead(){
	//Create some effects and kills the instance.
	alarm[0] = -1;
	sprite_index = sEnemyidle;
	
	if(alarm[4] == -1)
	{
		alarm[4] = room_speed * 1.2;
	}
	
	if(alarm[4] > 0)
	{
		if(alarm[4] == room_speed*1.2)
		{
			audio_play_sound(sndBurning,0,false);
		}
		if(alarm[4] == 30)
		{
			audio_play_sound(sndSoulGet,0,false);	
		}
		if(alarm[4] % 5 == 0)
		{
			for (var i = 0; i < 6; ++i) {
			    instance_create_layer(x+irandom_range(-sprite_width/2,sprite_width/2),y+irandom_range(-sprite_height/2,sprite_height/2),"Level",oHitEffect);
				randomize();
			}
		}
	}

}