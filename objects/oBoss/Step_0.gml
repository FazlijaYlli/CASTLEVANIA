healthbar_x = (global.width / 2) - (healthbar_width / 2);
healthbar_y = global.height * 0.9;

switch (state)
{
	case ENEMYSTATE.MOVING: 
		BossState_Moving();
	break;
	case ENEMYSTATE.HIT: 
		BossState_Hit();
	break;
	case ENEMYSTATE.DEAD: 
		BossState_Dead();
	break;
	case ENEMYSTATE.CHASE: 
		BossState_Chase();
	break;
}
