if vivo {
	direcao = "cima"
	sprite_index = imagem[2]
	//cima
	if !place_meeting(x , y - vel, obj_planta)		//se não houver planta
		if (place_free(x, y - vel)) || (place_meeting(x, y - vel, obj_explosao)) {
			y -= vel
			sprite_index = imagem[6]	//carregar sprite
			scr_enviar("y", y)				//enviar posicao p server
		}
	
	//deslizar na quina da parede
	if (keyboard_check(vk_left)==false) && (keyboard_check(vk_right)==false) && (place_meeting(x, y - vel, obj_parede)) {
		if (x - (floor(x / global.largura) * global.largura) <= 10) && (frac(floor(x / global.largura) / 2) == 0) {
			x -= vel
			scr_enviar("y", y)				//enviar posicao p server
		}
		if (x - (floor(x / global.largura) * global.largura) >= 05) && (frac(floor(x / global.largura) / 2) != 0) {
			x += vel
			scr_enviar("y", y)				//enviar posicao p server
		}
	}	
	
	//chutar a bomba
	if (place_meeting(x, y - vel, obj_bomba) && (chutar_bomba))
		with (instance_nearest(x, y - vel, obj_bomba))
			if solid vspeed = -4
}