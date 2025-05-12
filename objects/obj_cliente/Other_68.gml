show_debug_message(json_encode(async_load))

if (async_load[? "size"] > 0) {		//se houver informacao recebido do server
	var buff = async_load[? "buffer"]				//receber conteudo do buffer
	buffer_seek(buff, buffer_seek_start, 0)
	
	//var resposta = buffer_read(buff, buffer_string)
	
	var res_json = json_decode(buffer_read(buff, buffer_string))	//decodificar o buffer
	
	var conteudo
	
	if (ds_map_find_value(res_json, "x"))	conteudo = ds_map_find_value(res_json, "x")
	if (ds_map_find_value(res_json, "y"))	conteudo = ds_map_find_value(res_json, "y")
	if (ds_map_find_value(res_json, "id"))	conteudo = ds_map_find_value(res_json, "id")
	if (ds_map_find_value(res_json, "b") == "b")	conteudo = "bomba"
	if (ds_map_find_value(res_json, "bp") == "bp")	conteudo = "bomba pulando"
	if (ds_map_find_value(res_json, "m") == "m")	conteudo = "morreu"
	
	show_debug_message(conteudo)
	
}