switch(global.hitEffect)
{
	case 0:
		sprite_index = sEffectHit0;
		break;
	case 1:
		sprite_index = sEffectHit1;
		break;
}

global.hitEffect = global.hitEffect == 1 ? 0 : 1;