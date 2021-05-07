randomize();
move = 0;
hp = 2000;
hpMax = hp;
damage = 75;
detectionRadius = 90;
reactTime = 45;
soulValue = 150000;
hSpeed = 0;
vSpeed = 0;
wSpeedBase = 0.2;
wSpeed = 0.4;
gravForce = 0.5;
hyperarmor = false;
state = ENEMYSTATE.MOVING;
canBeHit = true;
hitsTaken = 1;
showDamage = false;
damageCombo = 0;
chargeRecovery = room_speed;
poiseBroken = false;
stunned = false;
global.isBossMet = false;

healthbar_width = 600;
healthbar_height = 35;
//healthbar_x = (camera_get_view_width(view_camera[0]) / 2) - (healthbar_width / 2);
healthbar_x = global.width;
healthbar_y = global.height;
//healthbar_y = (camera_get_view_height(view_camera[0])) - (healthbar_height / 4);

//If the death animation has been chosen
sprite_index = sBossWalking;