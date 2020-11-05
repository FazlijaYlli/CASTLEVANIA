hSpeed = 0;
vSpeed = 0;
wSpeed = 1;
jumpHeight = 6;
gravForce = 0.5;

crouch = false;

//STAIRS
goingToStairsUp = false;
climbingStairsUp = false;
goingToStairsDown = false;
climbingStairsDown = false;

//AUDIO
audioCanPlay = true;

camera = view_camera[0];

state = PLAYERSTATE.MOVING;
hitList = ds_list_create();

enum PLAYERSTATE
{
	MOVING,
	ATTACK,
	CROUCH_ATTACK,
	STAIR_ATTACK,
	ON_STAIRS
}