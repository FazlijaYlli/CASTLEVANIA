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
