///@description GO BACK TO MOVE AFTER HIT
if(distance_to_object(oPlayer) > detectionRadius)
{
	state = ENEMYSTATE.MOVING;
}
else
{
	state = ENEMYSTATE.CHASE;
}
canBeHit = true;
alarm[0] = -1;