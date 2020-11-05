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
		draw_text(0,30,"STATE : MOVING");
		break;
}


