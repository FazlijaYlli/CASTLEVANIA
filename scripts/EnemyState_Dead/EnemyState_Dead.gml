// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Dead(){
	
	instance_destroy();
	instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
	randomize();
	instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
	instance_create_layer(irandom_range(300,700),430,"Enemies",oEnemy);
}