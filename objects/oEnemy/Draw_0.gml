draw_self();

//DEBUG CIRCLES 

//draw_set_halign(fa_center);
//draw_set_valign(fa_middle);
//draw_set_alpha(0.1);
//draw_circle_color(x,y,detectionRadius,c_red,c_red,false)
//draw_set_alpha(1);
//draw_set_valign(fa_top);

//LIFE BARS
//draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-7.5,string(alarm[1]),1,1,0);
//switch(state)
//{
//	case 0:
//		draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-15,"MOVING",1,1,0);
//		break;
//	case 1:
//		draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-15,"HIT",1,1,0);
//		break;
//	case 2:
//		draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-15,"DEAD",1,1,0);
//		break;
//	case 3:
//		draw_text_transformed(healthbar_x + healthbar_width/2, healthbar_y-15,"CHASE",1,1,0);
//		break;
//}

if(healthbar_show)
{
	draw_sprite_stretched(sHealthBarBg,0,healthbar_x, healthbar_y-1,healthbar_width,healthbar_height);
	draw_sprite_stretched(sHealthBar,0,healthbar_x,healthbar_y-1,min((hp/hpMax * healthbar_width), healthbar_width), healthbar_height);
}

if(showDamage)
{
	draw_set_font(fntDamage);
	draw_set_halign(fa_right);
	draw_text_transformed(healthbar_x + healthbar_width, healthbar_y,damageCombo,0.05,0.05,0);
	draw_set_halign(fa_left)
}