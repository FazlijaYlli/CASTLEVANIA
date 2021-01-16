healthbar_x = x - 8;
healthbar_y = y - 24;

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
