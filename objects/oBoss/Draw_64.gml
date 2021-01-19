
/*
draw_set_font(fntDebug);
draw_set_halign(fa_left);
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
*/

//Boss Health Bar
if(global.isBossMet)
{
	draw_set_halign(fa_left);
	draw_set_font(fntBoss);
	draw_text(healthbar_x,healthbar_y - 25,"Squelette Rouge de Carthus");
	draw_sprite_stretched(sHealthBarBg,0,healthbar_x-6, healthbar_y,healthbar_width + 12, healthbar_height);
	draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height)
	draw_sprite_stretched(sHealthBarBorder,0,healthbar_x-6, healthbar_y,healthbar_width + 12, healthbar_height);
}

if(showDamage)
{
	draw_set_font(fntBoss)
	draw_set_halign(fa_right)
	draw_text(healthbar_x + healthbar_width, healthbar_y - 35,damageCombo);
}
