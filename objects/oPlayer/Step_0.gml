//Inputs
keyLeft = keyboard_check(vk_left);
keyRight = keyboard_check(vk_right);
keyUp = keyboard_check(vk_up);
keyJump = keyboard_check_pressed(vk_space);
keyCrouch = keyboard_check(vk_down);
keyAttack = keyboard_check_pressed(ord("F"));

camera_set_view_pos(camera,x-camera_get_view_width(camera)/2,camera_get_view_y(camera));

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
}