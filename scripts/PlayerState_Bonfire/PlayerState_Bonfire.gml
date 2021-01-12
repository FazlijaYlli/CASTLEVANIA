function PlayerState_Bonfire(){
	sprite_index = sSimonCrouch;
	if(hp != hpMax)
	{
		hp = hpMax;	
	}
	if(!instance_exists(oMenu))
	{
		instance_create_layer(x,y,"UI",oMenu);
	}
}