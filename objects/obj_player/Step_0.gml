//quando concluir a animacao de morte
if (sprite_index == imagem[9]) && (image_index>=4) {
	
	scr_enviar("m", "m", msg_type.STOP_HOST)	//envia p o server o estado de morte
	
}	
//se a explosao atingir o player
if (place_meeting(x, y, obj_explosao)) && vivo										
		script_execute(scr_jogador_morrendo)	//aciona o sprite de morte

