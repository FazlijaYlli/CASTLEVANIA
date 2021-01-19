//STATISTICS
hSpeed = 0;
vSpeed = 0;
wSpeed = 1;
sprintSpeed = 2;
attackStaminaCost = 20;
rollSpeed = 1.5;
rollFrames = 25;
rollStaminaCost = 50;
jumpHeight = 4.5;
gravForce = 0.25;
hp = 500;
hpMax = hp;
stamina = 200;
staminaMax = stamina;
staminaRegen = 0.5;
canRegenStamina = true;
canUseStamina = true;
damage = 50;
lostHp = 0;
lostStamina = 0;

//GUI
//HEALTHBAR
healthbar_width = 300;
healthbar_height = 20;
healthbar_x = (window_get_width() * 0.05);
healthbar_y = (window_get_height() * 0.05) - (healthbar_height / 4);

//STAMINABAR
staminabar_width = 300;
staminabar_height = 20;
staminabar_x = (window_get_width() * 0.05);
staminabar_y = ((window_get_height() * 0.05) - (healthbar_height / 4)) + healthbar_height + 3;

//STATES
canBeHit = true;
invincible = false;
dead = false;
crouch = false;
nearBonfire = false;
nearFogdoor = false;
isHealing = false;
isHealingStamina = false;
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
	ROLL,
	SPRINT,
}