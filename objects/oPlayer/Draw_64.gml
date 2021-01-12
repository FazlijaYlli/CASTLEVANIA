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
