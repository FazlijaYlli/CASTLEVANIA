
draw_set_font(fntDebug);
draw_set_halign(fa_left);
switch(state)
{
	case 0:
		draw_text(0,120,"BOSS_STATE : MOVING");
		break;
	case 1:
		draw_text(0,120,"BOSS_STATE : HIT");
		break;
	case 2:
		draw_text(0,120,"BOSS_STATE : DEAD");
		break;
	case 3:
		draw_text(0,120,"BOSS_STATE : CHASE");
		break;
	case 4:
		draw_text(0,120,"BOSS_STATE : CHARGE");
		break;
	case 5:
		draw_text(0,120,"BOSS_STATE : POISE_BROKEN");
		break;
	case 6:
		draw_text(0,120,"BOSS_STATE : RIPOSTED");
		break;
}

draw_text(0,105,"ALARM POISE_BROKEN: "+ string(alarm[7]));
draw_text(0,135,"CAN_BE_HIT: "+ string(canBeHit));
draw_text(0,150,"POISE_BROKEN: "+ string(poiseBroken));

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
