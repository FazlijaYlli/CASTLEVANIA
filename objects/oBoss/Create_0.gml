randomize();
move = 0;
hp = 800;
hpMax = hp;
damage = 200;
detectionRadius = 90;
reactTime = 45;
soulValue = 1;
hSpeed = 0;
vSpeed = 0;
wSpeedBase = 0.2;
wSpeed = 0.4;
gravForce = 0.5;
state = ENEMYSTATE.MOVING;
canBeHit = true;
hitsTaken = 1;
showDamage = false;
giveSouls = false;
damageCombo = 0;
global.isBossMet = false;

healthbar_width = 600;
healthbar_height = 35;
//healthbar_x = (camera_get_view_width(view_camera[0]) / 2) - (healthbar_width / 2);
healthbar_x = global.width;
healthbar_y = global.height;
//healthbar_y = (camera_get_view_height(view_camera[0])) - (healthbar_height / 4);

//If the death animation has been chosen
sprite_index = sBossWalking;