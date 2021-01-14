switch (state)
{
	case ENEMYSTATE.MOVING: 
		EnemyState_Moving();
	break;
	case ENEMYSTATE.HIT: 
		EnemyState_Hit();
	break;
	case ENEMYSTATE.DEAD: 
		EnemyState_Dead();
	break;
	case ENEMYSTATE.CHASE: 
		EnemyState_Chase();
	break;
}
