show_debug_message("< " + json_encode(async_load))	//depuracao ---- apagar depois!!!!

if (async_load[? "size"] > 0) {		//se houver informacao recebido do server
	var buff = async_load[? "buffer"]				//receber conteudo do buffer
	buffer_seek(buff, buffer_seek_start, 0)			//leitura do buffer
	
	//var resposta = buffer_read(buff, buffer_string)
	
	var res_json = json_decode(buffer_read(buff, buffer_string))	//decodificar o buffer
	
	var conteudo
	
	if (ds_map_find_value(res_json, "x"))	conteudo = ds_map_find_value(res_json, "x")
	if (ds_map_find_value(res_json, "y"))	conteudo = ds_map_find_value(res_json, "y")
	if (ds_map_find_value(res_json, "id"))	conteudo = ds_map_find_value(res_json, "id")
	if (ds_map_find_value(res_json, "b") == "b")	conteudo = "bomba"
	if (ds_map_find_value(res_json, "bp") != "") {
		switch (ds_map_find_value(res_json, "bp")) {
			case "bb":
				conteudo = "bomba pulando para baixo"
				break
			case "bc":
				conteudo = "bomba pulando para cima"
				break
			case "be":
				conteudo = "bomba pulando para esquerda"
				break
			case "bd":
				conteudo = "bomba pulando para direita"
				break
		}
	}
	if (ds_map_find_value(res_json, "t") != "") {
		switch (ds_map_find_value(res_json, "t")) {
			case msg_type.CREATE_HOST:
				show_debug_message("< " + "CREATE_HOST")
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