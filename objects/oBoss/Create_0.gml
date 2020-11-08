randomize();
move = 0;
hp = 1;
hpMax = hp;
hSpeed = 0;
vSpeed = 0;
wSpeed = 0.75;
gravForce = 0.5;
state = ENEMYSTATE.MOVING;
canBeHit = true;
global.isBossMet = false;

healthbar_width = 578;
healthbar_height = 24;
healthbar_x = (window_get_width() / 2) - (healthbar_width / 2);
healthbar_y = (window_get_height() - 75) - (healthbar_height / 4);


//If the death animation has been chosen
sprite_index = sBossWalking;