randomize();
move = choose(1, -1);
hp = 3;
hSpeed = 0;
vSpeed = 0;
wSpeed = 0.5;
gravForce = 0.5;
state = ENEMYSTATE.MOVING;
canBeHit = true;

//If the death animation has been chosen
sprite_index = sEnemyWalking;

enum ENEMYSTATE
{
	MOVING,
	HIT,
	DEAD
}