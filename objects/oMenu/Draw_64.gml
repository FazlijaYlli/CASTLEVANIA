draw_sprite_stretched(sMenu,0,posX,posY,150,30+separation*array_length_1d(menu));

for (i = 0; i < array_length_1d(menu); i += 1) {
	if(cursor == i)
	{
		draw_text_color(posX+20,posY+20+(separation*i),menu[i],c_orange, c_orange, c_orange, c_orange, 1);
	}
	else
	{
		draw_text(posX+20,posY+20+(separation*i),menu[i])
	}
}



