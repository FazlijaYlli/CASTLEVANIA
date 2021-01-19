// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Dead(){
	//Create some effects and kills the instance.
	alarm[0] = -1;
	sprite_index = sEnemyidle;
	if(instance_exists(oPlayer))
	{
		AddToSouls(soulValue, self);
	}
}