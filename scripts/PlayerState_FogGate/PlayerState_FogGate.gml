function PlayerState_FogGate(){
	global.isBossMet = true;
	//instance_destroy(currentDoor);
	x += 48 * -image_xscale;
	state = PLAYERSTATE.MOVING;
}