// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AddToSouls(souls){
	if(alarm[4] == -1)
	{
		alarm[4] = 30 + souls/1000;
		soulCountTarget = oPlayer.soulCount + souls;
		frameSouls = round(souls / alarm[4]) + 1;
		target = 0;
	}
	
	if(alarm[4] != -1)
	{
		target = round(oPlayer.soulCount + frameSouls);
		while(oPlayer.soulCount < target)
		{
			oPlayer.soulCount += 1;
		}
	}
	
	if(oPlayer.soulCount >= soulCountTarget)
	{
		global.soulsToAdd = 0;
		global.showSoulsAdded = false;
		oPlayer.soulCount = soulCountTarget;
		alarm[4] = -1;
	}
}