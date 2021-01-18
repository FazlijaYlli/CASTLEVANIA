randomize();
move = choose(1, -1);
hp = 125;
hpMax = hp;
reactTime = 60;
damage = 150;
hSpeed = 0;
vSpeed = 0;
wSpeed = 0.5;
jumpHeight = 4;
gravForce = 0.5;
baseDetectionRadius = 64;
detectionRadius = baseDetectionRadius;
state = ENEMYSTATE.MOVING;
canBeHit = true;

damageCombo = 0;
showDamage = false;
healthbar_x = x;
healthbar_y = y - sprite_get_height(self)/2+16;
healthbar_height = 2;
healthbar_width = 12;
healthbar_show = false;

//If the death animation has been chosen
sprite_index = sEnemyWalking;

enum ENEMYSTATE
{
	MOVING,
	HIT,
	DEAD,
	CHASE,
}