// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddToSouls(souls, instance){
	if(alarm[4] == -1)
	{
		alarm[4] = 30;
		soulCountTarget = oPlayer.soulCount + souls;
		frameSouls = round(souls / alarm[4]) + 1;
		target = 0;
	}
	if(alarm[4] != -1)
	{
		if(alarm[4] % 10 == 0)
		{
			instance_create_layer(instance.x+irandom_range(-instance.sprite_width/2,instance.sprite_width/2),instance.y+irandom_range(-instance.sprite_height/2,instance.sprite_height/2),"Level",oHitEffect);
			randomize();
			//audio_play_sound(sndEnemyDeath,0,false);
			instance_create_layer(instance.x+irandom_range(-instance.sprite_width/2,instance.sprite_width/2),instance.y+irandom_range(-instance.sprite_height/2,instance.sprite_height/2),"Level",oHitEffect);	
		}
		target = round(oPlayer.soulCount + frameSouls);
		while(oPlayer.soulCount < target)
		{
			oPlayer.soulCount += 1;
		}
	}
	
	if(oPlayer.soulCount >= soulCountTarget)
	{
		instance_destroy(instance);
		oPlayer.soulCount = soulCountTarget;
		sprite_index = sSimonInvisible;
	}
}