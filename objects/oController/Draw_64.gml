/*draw_set_font(fntDebug);
draw_set_halign(fa_left);
draw_text(0,150,"DEATH_ALARM : "+ string(alarm[0]));
draw_text(0,165,"FADE: "+ string(fade));
draw_set_font(fntDeath);
*/

if(alarm[0] <= room_speed*5 and alarm[0] > room_speed*4)
{
	fade = 1-((alarm[0] - (room_speed*4)) / room_speed) + 0.02;
	draw_set_halign(fa_center);
	draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,"YOU DIED",make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),fade);
}
else if (alarm[0] <= room_speed*4 and alarm[0] >= room_speed)
{
	draw_set_halign(fa_center);
	draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,"YOU DIED",make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),1);
}
else if (alarm[0] > 0)
{
	fade = (alarm[0] / room_speed) - 0.02;
	draw_set_halign(fa_center);
	draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,"YOU DIED",make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),make_color_rgb(200,0,0),fade);
}
else
{
	alarm[0] = -1;
}