function scr_send_packet(argument0){
		
	var buffer = buffer_create(1024, buffer_grow, 1)
	buffer_seek(buffer, 0, 1)
	buffer_write(buffer, buffer_text, argument0)
	network_send_raw(global.socket, buffer, buffer_tell(buffer)) //enviar o buffer na rede
	
	
}