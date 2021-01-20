//ACTIONS DU TABLEAU
if(keyboard_check_pressed(vk_enter))
{
	audio_play_sound(sndCursorSelect,0,false);
	switch(cursor)
	{
		case 0:
			with(oPlayer)
			{
				state = PLAYERSTATE.MOVING;
				invincible = false;
			}
			instance_destroy();
		break;
		case 1:
			if(oPlayer.soulCount >= 1000)
			{
				oPlayer.soulCount -= 1000;
				oPlayer.damage += 150;
			}
		break;
		case 2:
			room_restart();			
		break;
		case 3:
			game_end();
		break;
	}
}


//POSITIONNEMENT DU CURSEUR
if(keyboard_check_pressed(vk_up))
{
	if(cursor != 0)
	{
		cursor -= 1;
		audio_play_sound(sndCursorMove,0,false);
	}
}

if (keyboard_check_pressed(vk_down))
{
	if(cursor != array_length_1d(menu) -1)
	{
		cursor += 1;
		audio_play_sound(sndCursorMove,0,false);
	}
}