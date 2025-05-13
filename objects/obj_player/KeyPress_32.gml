if vivo {	
	
	if !(place_meeting(x ,y ,obj_bomba)) && (bombas > 0) {	
		
		scr_enviar("b", "b", msg_type.SET_PLAYER_STAT)							//enviar criacao da bomba p server
	
	} else {
		//se estiver sobre uma bomba e possuir a luva
		if (place_meeting(x ,y , obj_bomba) && luva) {
			
			scr_enviar("bp", other.direcao, msg_type.SET_PLAYER_STAT)		//enviar lancamento de bomba p o server
		}
	}
}