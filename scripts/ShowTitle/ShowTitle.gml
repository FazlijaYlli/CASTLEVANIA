// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function ShowTitle(text,r,g,b){
	draw_set_font(fntTitle);

	if(alarm[0] <= room_speed*5 and alarm[0] > room_speed*4)
	{
		fade = 1-((alarm[0] - (room_speed*4)) / room_speed) + 0.02;
		draw_set_halign(fa_center);
		draw_set_alpha(fade)
		draw_sprite(sTitleBackground,0,camera_get_view_width(0)/2,camera_get_view_height(0)/2)
		draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,string(text),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),fade);
		draw_set_alpha(1)
	}
	else if (alarm[0] <= room_speed*4 and alarm[0] >= room_speed)
	{
		draw_set_halign(fa_center);
		draw_set_alpha(1)
		draw_sprite(sTitleBackground,0,camera_get_view_width(0)/2,camera_get_view_height(0)/2)
		draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,string(text),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),1);
	}
	else if (alarm[0] > 0)
	{
		fade = (alarm[0] / room_speed) - 0.02;
		draw_set_halign(fa_center);
		draw_set_alpha(fade)
		draw_sprite(sTitleBackground,0,camera_get_view_width(0)/2,camera_get_view_height(0)/2)
		draw_text_color(camera_get_view_width(0)/2, camera_get_view_height(0)/2-50,string(text),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),make_color_rgb(r,g,b),fade);
		draw_set_alpha(1)
	}
	else
	{
		alarm[0] = -1;
	}
}