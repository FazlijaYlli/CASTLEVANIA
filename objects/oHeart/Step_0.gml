//Vertical Movement 
vSpeed = vSpeed + grav;

if(vSpeed >= 1)
{
	vSpeed = 1;	
}
	
//Horizontal Collisions
if (place_meeting(x+hSpeed,y,oWall)) 
{
	while(!place_meeting(x+sign(hSpeed),y,oWall)) 
	{
		x += sign(hSpeed);
	}
		
	hSpeed = 0;
}

x += hSpeed;

//Vertical Collisions
if (place_meeting(x,y+vSpeed,oWall)) 
{
	while(!place_meeting(x,y+sign(vSpeed),oWall)) 
	{
		y += sign(vSpeed);
	}
	vSpeed = 0;
}
	
y += vSpeed;

if(place_meeting(x,y,oPlayer))
{
	oPlayer.hp += 100;
	audio_play_sound(sndHeal,0,false);
	instance_destroy();
}
