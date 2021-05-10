x += dir * spd;
if(place_meeting(x,y,oEnemy))
{
	currentEnemy = instance_place(x,y,oEnemy)
	{
		with(currentEnemy)
		{
			DamageHit(oKnife.dmg, 0.9, 20);		
		}
	}
	instance_destroy();
}

