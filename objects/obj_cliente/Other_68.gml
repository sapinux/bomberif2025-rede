show_debug_message(json_encode(async_load))

if (async_load[? "size"] > 0) {
	var buff = async_load[? "buffer"]
	buffer_seek(buff, buffer_seek_start, 0)
	var resposta = buffer_read(buff, buffer_string)
	show_debug_message(resposta)
}