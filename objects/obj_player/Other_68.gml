//show_debug_message("< " + json_encode(async_load))	//depuracao ---- apagar depois!!!!

if (async_load[? "size"] > 0) {		//se houver informacao recebido do server
	var buff = async_load[? "buffer"]				//receber conteudo do buffer
	buffer_seek(buff, buffer_seek_start, 0)			//leitura do buffer
			
	var res_json = json_decode(buffer_read(buff, buffer_string))	//decodificar o buffer
	
	var conteudo
	
	if (ds_map_find_value(res_json, "x"))	conteudo = ds_map_find_value(res_json, "x")
	if (ds_map_find_value(res_json, "y"))	conteudo = ds_map_find_value(res_json, "y")
	if (ds_map_find_value(res_json, "id"))	conteudo = ds_map_find_value(res_json, "id")
	if (ds_map_find_value(res_json, "b") == "b") {
		conteudo = "bomba"			//para depuracao - provisorio
		
		var bomba = instance_create_layer(x, y, "Action", obj_bomba)	//criar bomba
		with (bomba) {
			id_pai = global.id_pai							//recebe o id do player criador da bomba
			poder_bomba = other.poder_bomba					//recebe o poder de alcance da explosao
			other.bombas --									//diminui a quantidade de bombas
		}
	}
	//melhgorar o codigo abaixo -------------------
	if (ds_map_find_value(res_json, "bp") == "b") ||
		(ds_map_find_value(res_json, "bp") == "c") ||
		(ds_map_find_value(res_json, "bp") == "d") ||
		(ds_map_find_value(res_json, "bp") == "e")
		{
		
		var bomba_pulando = instance_create_layer(x ,y , "Action", obj_bomba_pulando)
			with (bomba_pulando) {
				//verifica a direcao do player
				switch (ds_map_find_value(res_json, "bp")) {
					case "c":
						vspeed = -4
						conteudo = "bomba pulando para cima"	//depuracao -- provisorio
						break
					case "b":
						vspeed = 4
						conteudo = "bomba pulando para baixo"	//depuracao -- provisorio
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
	if (ds_map_find_value(res_json, "t") != "") {
		switch (ds_map_find_value(res_json, "t")) {
			case msg_type.CREATE_HOST:
				show_debug_message("< " + "CREATE_HOST " + string(ds_map_find_value(res_json, "hn")))
				global.host_number = ds_map_find_value(res_json, "hn")
				global.player_number = ds_map_find_value(res_json, "pn")
				break
			case msg_type.JOIN_HOST:
				show_debug_message("< " + "JOIN_HOST")
				break
			case msg_type.SET_PLAYER_STAT:
				show_debug_message("< " + "SET_PLAYER_STAT")
				break
			case msg_type.STOP_HOST:
				show_debug_message("< " + "STOP_HOST")
				break
		}
	} 
	if (ds_map_find_value(res_json, "m") == "m")	conteudo = "morreu"
	
	show_debug_message("< " + string (conteudo))
	
}