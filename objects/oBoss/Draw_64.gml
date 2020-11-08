switch(state)
{
	case 0:
		draw_text(0,45,"BOSS_STATE : MOVING");
		break;
	case 1:
		draw_text(0,45,"BOSS_STATE : HIT");
		break;
	case 2:
		draw_text(0,45,"BOSS_STATE : DEAD");
		break;
}
draw_text(0,60,"BOSS_HIT_ALARM : " + string(alarm[0]));
draw_text(0,75,"BOSS_DEATH_ALARM : " + string(alarm[1]));
draw_text(0,90,"BOSS_HP : " + string(hp));
draw_text(0,120,"IS_BOSS_MET : " + string(global.isBossMet));

//Boss Health Bar
if(global.isBossMet)
{
	draw_set_font(fntBoss)
	draw_text(healthbar_x,healthbar_y - 35,"Squelette Rouge de Carthus");
	draw_sprite(sHealthBarBg,0,healthbar_x, healthbar_y);
	draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height)
	draw_sprite(sHealthBarBorder,0,healthbar_x, healthbar_y);
}
