draw_sprite_stretched(sHealthBarBg,0,healthbar_x, healthbar_y,healthbar_width,healthbar_height);
draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height)
draw_sprite_stretched(sHealthBarBorder,0,healthbar_x, healthbar_y,healthbar_width,healthbar_height);

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


////////////////////////////////////////////
/////////////////DEBUG//////////////////////
////////////////////////////////////////////

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
}

draw_text(0,105,"INVINCIBLE: "+ string(invincible));
draw_text(0,135,"HP: "+ string(hp));

////////////////////////////////////////////
/////////////////DEBUG//////////////////////
////////////////////////////////////////////
