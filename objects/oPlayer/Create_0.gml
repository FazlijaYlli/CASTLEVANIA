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
staminaRegen = 0.75;
canRegenStamina = true;
canUseStamina = true;
damage = 25;
lostHp = 0;
riposte = false;
riposteDuration = room_speed*2;
lostStamina = 0;
soulCount = 0;

//GUI
//HEALTHBAR
healthbar_width = 300;
healthbar_height = 20;
healthbar_x = 0;
healthbar_y = 0;

//STAMINABAR
staminabar_width = 300;
staminabar_height = 20;
staminabar_x = 0;
staminabar_y = 0;

//SOULCOUNT
soulcntr_width = 128;
soulcntr_height = 48;
soulcntr_x = 0;
soulcntr_y = 0;

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
	RIPOSTE
}