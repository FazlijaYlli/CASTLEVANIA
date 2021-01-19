randomize();
move = 0;
hp = 800;
hpMax = hp;
damage = 200;
detectionRadius = 90;
reactTime = 45;
hSpeed = 0;
vSpeed = 0;
wSpeedBase = 0.2;
wSpeed = 0.4;
gravForce = 0.5;
state = ENEMYSTATE.MOVING;
canBeHit = true;
hitsTaken = 1;
showDamage = false;
damageCombo = 0;
global.isBossMet = false;

healthbar_width = 600;
healthbar_height = 35;
healthbar_x = (window_get_width() / 2) - (healthbar_width / 2);
healthbar_y = (window_get_height() - 50) - (healthbar_height / 4);


//If the death animation has been chosen
sprite_index = sBossWalking;