instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
randomize();
instance_create_layer(x+irandom_range(-7,7),y+irandom_range(-5,5),"Level",oHitEffect);
instance_create_layer(x,y,"Level",oHeart);
audio_play_sound(sndBreak,0,false);