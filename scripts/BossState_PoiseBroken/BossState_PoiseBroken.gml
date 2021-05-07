// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function BossState_PoiseBroken(){
	image_speed = 0;
	if(alarm[7] == -1)
	{
		alarm[7] = room_speed*3;
		if(!audio_is_playing(sndParry))
		{
			audio_play_sound(sndParry,0,false);	
		}
    }
	if(oPlayer.state == PLAYERSTATE.RIPOSTE and alarm[7] > 0)
	{
		if(oPlayer.riposte)
		{
			if(canBeHit and (hp - oPlayer.damage * 10) > 0)
			{
				//Withdraw HP.
				hp -= oPlayer.damage * 10;
				damageCombo += oPlayer.damage;
				hitsTaken += 1;	
				state = ENEMYSTATE.RIPOSTED;
				oPlayer.riposte = false;
			}
			else
			{
				hp -= oPlayer.damage * 10;
				state = ENEMYSTATE.DEAD;
				if (!audio_is_playing(sndEnemyDeath)) 
				{
					audio_play_sound(sndEnemyDeath,0,false);
				}
			}
		}
		else 
		{
			alarm[7] = 180;	
		}
	}
	else if (alarm[7] == 0)
	{
		alarm[7] = -1;
		poiseBroken = false;
		canBeHit = true;
		state = ENEMYSTATE.MOVING;
	}
	else
	{
		x += -move * 0.05;	
	}
}