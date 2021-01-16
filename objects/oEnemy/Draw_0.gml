draw_self();

//DEBUG CIRCLES
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_alpha(0.1);
draw_circle_color(x,y,detectionRadius,c_red,c_red,false)
draw_set_alpha(1);
draw_set_valign(fa_top);

//LIFE BARS

if(healthbar_show)
{
	draw_sprite_stretched(sHealthBarBg,0,healthbar_x, healthbar_y,healthbar_width,healthbar_height);
	draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height);
}

if(showDamage)
{
	draw_set_font(fntDamage)
	draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-7.5,damageCombo,0.05,0.05,0);
}