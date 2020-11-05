randomize();
move = choose(1, -1);
hp = 5;
hSpeed = 0;
vSpeed = 0;
wSpeed = 0.75;
gravForce = 0.5;
state = ENEMYSTATE.MOVING;
canBeHit = true;

//If the death animation has been chosen
sprite_index = sBossWalking;