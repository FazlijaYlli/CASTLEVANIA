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
