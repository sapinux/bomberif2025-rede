switch (opcoes[indice]) {
	case "Iniciar":
		scr_enviar("m", "i", msg_type.CREATE_HOST)
		//room_goto(rm_player_select)
		break
	//case "Selecionar Jogador":
	//	room_goto(rm_player_select)
	//	break
	case "Configurações":
		room_goto(rm_config)
		break
	case "Sair":
		game_end()
		break
}
