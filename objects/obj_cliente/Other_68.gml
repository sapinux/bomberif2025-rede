//show_debug_message("< " + json_encode(async_load))	//depuracao -- provisorio

if (async_load[? "size"] > 0) {		//se houver informacao recebido do server
	var buff = async_load[? "buffer"]				//receber conteudo do buffer
	buffer_seek(buff, buffer_seek_start, 0)			//leitura do buffer
			
	var res_json = json_decode(buffer_read(buff, buffer_string))	//decodificar o buffer
	
	var conteudo		//depuracao -- provisorio
	
	if (ds_map_find_value(res_json, "x")) {
		conteudo = ds_map_find_value(res_json, "x")		//depuracao -- provisorio
	}
	
	if (ds_map_find_value(res_json, "y")) {
		conteudo = ds_map_find_value(res_json, "y")		//depuracao -- provisorio
	}
	
	if (ds_map_find_value(res_json, "id"))	conteudo = ds_map_find_value(res_json, "id")	//depuracao -- provisorio
	
	if (ds_map_find_value(res_json, "b") == "b") {
		conteudo = "bomba"			//para depuracao - provisorio
		
		var bomba = instance_create_layer(global.id_pai.x, global.id_pai.y, "Action", obj_bomba)	//criar bomba
		with (bomba) {
			id_pai = global.id_pai							//recebe o id do player criador da bomba
			poder_bomba = global.id_pai.poder_bomba			//recebe o poder de alcance da explosao
			global.id_pai.bombas --							//diminui a quantidade de bombas
		}
	}

	if (typeof(ds_map_find_value(res_json, "bp")) != "undefined") {
		var bomba_pulando = instance_create_layer(global.id_pai.x ,global.id_pai.y , "Action", obj_bomba_pulando)	//criar bomba pulando
			with (bomba_pulando) {
				switch (ds_map_find_value(res_json, "bp")) {		//verifica a direcao do player
					case "c":
						vspeed = -4
						conteudo = "bomba pulando para cima"		//depuracao -- provisorio
						break
					case "b":
						vspeed = 4
						conteudo = "bomba pulando para baixo"		//depuracao -- provisorio
						break
					case "e":
						hspeed = -4
						conteudo = "bomba pulando para esquerda"	//depuracao -- provisorio
						break
					case "d":
						hspeed = 4
						conteudo = "bomba pulando para direita"		//depuracao -- provisorio
						break
				}
			}
	}
	
	if (typeof(ds_map_find_value(res_json, "t")) != "undefined") {
		switch (ds_map_find_value(res_json, "t")) {
			case msg_type.CREATE_HOST:
				show_debug_message("< " + "CREATE_HOST: " + string(ds_map_find_value(res_json, "hn")))	//depuracao -- provisorio
				global.host_number = ds_map_find_value(res_json, "hn")
				global.player_number = ds_map_find_value(res_json, "pn")
				room_goto(rm_player_select)				//carrega a tela de escolha de personagem
				conteudo = "host criado!"				//depuracao -- provisorio
				break
			case msg_type.JOIN_HOST:
				show_debug_message("< " + "JOIN_HOST")	//depuracao -- provisorio
				break
			case msg_type.SET_PLAYER_STAT:
				show_debug_message("< " + "SET_PLAYER_STAT: " + string(ds_map_find_value(res_json, "hn")))	//depuracao -- provisorio
				break
			case msg_type.STOP_HOST:
				show_debug_message("< " + "STOP_HOST")	//depuracao -- provisorio
				break
		}
	} 
	if (ds_map_find_value(res_json, "m") == "m") {
		instance_destroy(global.id_pai)
		global.id_pai = 0
		conteudo = "morreu"		//depuracao -- provisorio
	}
	
	show_debug_message("< " + string (conteudo))	//depuracao -- provisorio
	
}