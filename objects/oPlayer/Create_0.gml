//STATISTICS
hSpeed = 0;
vSpeed = 0;
wSpeed = 1;
rollSpeed = 1.5;
rollFrames = 25;
jumpHeight = 4.5;
gravForce = 0.25;
hp = 500;
hpMax = hp;
damage = 50;
lostHp = 0;

//GUI
healthbar_width = 300;
healthbar_height = 20;
healthbar_x = (window_get_width() * 0.05	);
healthbar_y = (window_get_height() * 0.05) - (healthbar_height / 4);

//STATES
canBeHit = true;
invincible = false;
dead = false;
crouch = false;
nearBonfire = false;
nearFogdoor = false;
isHealing = false;
state = PLAYERSTATE.MOVING;
hitList = ds_list_create();

//STAIRS
goingToStairsUp = false;
climbingStairsUp = false;
goingToStairsDown = false;
climbingStairsDown = false;

//AUDIO
audioCanPlay = true;

//VIEW
camera = view_camera[0];

//ENUMS
enum PLAYERSTATE
{
	MOVING,
	ATTACK,
	CROUCH_ATTACK,
	STAIR_ATTACK,
	ON_STAIRS,
	HIT,
	DEAD,
	FOG_GATE,
	BONFIRE,
	ROLL
}