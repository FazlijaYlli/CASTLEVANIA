// Les actifs du script ont changé pour v2.3.0 Voir
// https://help.yoyogames.com/hc/en-us/articles/360005277377 pour plus d’informations
function EnemyState_Dead(){
	
	instance_destroy();
	instance_create_depth(x+irandom_range(-7,7),y+irandom_range(-5,5),0,oHitEffect);
	randomize();
	instance_create_depth(x+irandom_range(-7,7),y+irandom_range(-5,5),0,oHitEffect);
	instance_create_depth(irandom_range(300,700),430,0,oEnemy);
}