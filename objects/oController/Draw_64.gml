/*draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_text(0,150,"DEATH_ALARM : "+ string(alarm[0]));
draw_text(0,165,"FADE: "+ string(fade));
*/

if(oPlayer.dead)
{
	ShowTitle("YOU DIED",200,0,0);
}
else if(!instance_exists(oBoss))
{
	ShowTitle("YOU DEFEATED", 255,180,0);
}


