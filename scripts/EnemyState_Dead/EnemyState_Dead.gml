// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Dead(){
	//Create some effects and kills the instance.
	instance_destroy();
	instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
	randomize();
	instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
}