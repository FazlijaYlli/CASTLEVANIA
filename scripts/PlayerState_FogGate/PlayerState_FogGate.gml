function PlayerState_FogGate(){
	global.isBossMet = true;
	//instance_destroy(currentDoor);
	x += (sprite_get_width(oDoor)) * -image_xscale;
	state = PLAYERSTATE.MOVING;
}