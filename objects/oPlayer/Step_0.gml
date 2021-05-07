//Inputs
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyJump = keyboard_check_pressed(vk_space);
keyCrouch = keyboard_check(vk_down);
keyAttack = keyboard_check_pressed(ord("F"));
keyInteract = keyboard_check_pressed(ord("E"));
keyRoll = keyboard_check_pressed(vk_control);
keySprint = keyboard_check(vk_shift);

//GUI COORDINATES
healthbar_x =  global.width * 0.05;
healthbar_y =  global.height * 0.025;

staminabar_x = global.width * 0.05;
staminabar_y = global.height * 0.065;

soulcntr_x = global.width * 0.8;
soulcntr_y = global.height * 0.025;

//HEALTH CONTROL
if(hp > hpMax)
{
	hp = hpMax;	
}

//STAMINA CONTROL
if(state != PLAYERSTATE.BONFIRE and stamina <= 0 and alarm[5] == -1)
{
	canRegenStamina = false;
	stamina = 0;
	alarm[5] = room_speed*1;
}


switch (state)
{
	case PLAYERSTATE.MOVING: 
		PlayerState_Moving();
		break;
	case PLAYERSTATE.ON_STAIRS:
		PlayerState_OnStairs();
		break;
	case PLAYERSTATE.CROUCH_ATTACK:
		PlayerState_CrouchAttack();
		break;
	case PLAYERSTATE.STAIR_ATTACK:
		PlayerState_StairAttack();
		break;
	case PLAYERSTATE.ATTACK: 
		PlayerState_Attack();
		break;
	case PLAYERSTATE.HIT: 
		PlayerState_Hit();
	break;
	case PLAYERSTATE.DEAD: 
		PlayerState_Dead();
	break;
	case PLAYERSTATE.FOG_GATE: 
		PlayerState_FogGate();
	break;
	case PLAYERSTATE.BONFIRE:
		PlayerState_Bonfire();
	break;
	case PLAYERSTATE.ROLL:
		PlayerState_Roll();
	break;
	case PLAYERSTATE.SPRINT:
		PlayerState_Sprint();
	break;
	case PLAYERSTATE.RIPOSTE:
		PlayerState_Riposte();
	break;
}
