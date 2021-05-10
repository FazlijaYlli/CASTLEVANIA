healthbar_x = (global.width / 2) - (healthbar_width / 2);
healthbar_y = global.height * 0.9;

if (hp <= 0 or keyboard_check(ord("U")))
{
	state = ENEMYSTATE.DEAD;	
}

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
	case ENEMYSTATE.CHARGE:
		BossState_Charge();
	break;
	case ENEMYSTATE.POISE_BROKEN:
		BossState_PoiseBroken();
	break;
	case ENEMYSTATE.RIPOSTED:
		BossState_Riposted();
	break;
}
