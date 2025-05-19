switch (opcoes[indice]) {
	case "Iniciar":
		scr_enviar("m", "i", msg_type.CRIAR_SALA)
		break
	case "Configurações":
		room_goto(rm_config)
		break
	case "Sair":
		game_end()
		break
}