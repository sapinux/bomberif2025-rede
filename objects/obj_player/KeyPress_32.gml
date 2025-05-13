if vivo {	
	
	if !(place_meeting(x ,y ,obj_bomba)) && (bombas > 0) {	
		
		scr_enviar("b", "b", msg_type.SET_PLAYER_STAT)							//enviar criacao da bomba p server
	
	} else {
		//se estiver sobre uma bomba e possuir a luva
		if (place_meeting(x ,y , obj_bomba) && luva) {
			var bomba_pulando = instance_create_layer(x ,y , "Action", obj_bomba_pulando)
			with (bomba_pulando) {
				//verifica a direcao do player
				switch (other.direcao) {
					case "c":
						vspeed = -4
						break
					case "b":
						vspeed = 4
						break
					case "e":
						hspeed = -4
						break
					case "d":
						hspeed = 4
						break
				}
			}
			scr_enviar("bp", other.direcao, msg_type.SET_PLAYER_STAT)		//enviar lancamento de bomba p o server
		}
	}
}