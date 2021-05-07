
//DRAW HEALTHBAR
draw_sprite_stretched(sHealthBarBg,0,healthbar_x, healthbar_y,healthbar_width,healthbar_height);
draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height)
//draw_sprite_stretched(sHealthBarBorder,0,healthbar_x, healthbar_y,healthbar_width,healthbar_height);

draw_sprite_stretched(sHealthBarBg,0,staminabar_x, staminabar_y,staminabar_width,staminabar_height);
draw_sprite_stretched(sStaminaBar,0,staminabar_x,staminabar_y,min((stamina/staminaMax * staminabar_width), staminabar_width), staminabar_height)
//draw_sprite_stretched(sHealthBarBorder,0,staminabar_x, staminabar_y,staminabar_width,staminabar_height);

//DRAW PROMPTS
draw_set_font(fntMenu);
draw_sprite_stretched(sSoulCntr,0,soulcntr_x,soulcntr_y,soulcntr_width,soulcntr_height);
draw_set_halign(fa_right);
draw_set_valign(fa_middle);
draw_text(soulcntr_x + (soulcntr_width * 0.9),soulcntr_y + (soulcntr_height * 0.5) + 2,string(soulCount));
if(global.showSoulsAdded)
{
	draw_text(soulcntr_x + (soulcntr_width * 0.9),soulcntr_y + (soulcntr_height * 1.5),"+ "+string(global.soulsToAdd));	
}
draw_set_halign(fa_center);
draw_set_valign(fa_top);


if(nearBonfire)
{
	if(!oBonfire.used)
	{
		draw_set_font(fntMenu);
		draw_set_halign(fa_center);
		draw_sprite(sPrompt,0,camera_get_view_width(0)/2,camera_get_view_height(0)* 0.85);
		draw_text(camera_get_view_width(0)/2,camera_get_view_height(0)*0.85-12,"E : Se reposer au feu");
	}
}

if(nearFogdoor and !global.isBossMet)
{
	draw_set_font(fntMenu);
	draw_set_halign(fa_center);
	draw_sprite(sPrompt,0,camera_get_view_width(0)/2,camera_get_view_height(0)* 0.85);
	draw_text(camera_get_view_width(0)/2,camera_get_view_height(0)*0.85-12,"E : Entrer dans le brouillard");
}


draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_text(0,0,"X: "+string(x));
draw_text(0,15,"Y: "+string(y));

switch(state)
{
	case 0:
		draw_text(0,30,"STATE : MOVING");
		break;
	case 1:
		draw_text(0,30,"STATE : STANDING_ATTACK");
		break;
	case 2:
		draw_text(0,30,"STATE : CROUCH_ATTACK");
		break;
	case 3:
		draw_text(0,30,"STATE : STAIR_ATTACK");
		break;
	case 4:
		draw_text(0,30,"STATE : ON_STAIRS");
		break;
	case 5:
		draw_text(0,30,"STATE : HIT");
		break;
	case 6:
		draw_text(0,30,"STATE : DEAD");
		break;
	case 7:
		draw_text(0,30,"STATE : FOG_GATE");
	break;
	case 8:
		draw_text(0,30,"STATE : BONFIRE");
	break;
	case 9:
		draw_text(0,30,"STATE : ROLL");
	break;
	case 10:
		draw_text(0,30,"STATE : SPRINT");
	break;
	case 11:
		draw_text(0,30,"STATE : RIPOSTE");
	break;
}

draw_text(0,45,"INVINCIBLE: "+ string(invincible));
draw_text(0,60,"HP: "+ string(hp));
draw_text(0,75,"STAMINA: "+ string(stamina));
draw_text(0,90,"ALARM 3: "+ string(alarm[3]));