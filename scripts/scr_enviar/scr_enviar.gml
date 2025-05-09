function scr_enviar(argument0, argument1) {
//adicionando valor ao mapa

ds_map_add(global.data, "x", argument0)		//posicao x
ds_map_add(global.data, "y", argument1)		//posicao y
data_json = json_encode(global.data) //converter o mapa em json que é uma string
ds_map_clear(global.data)	//limpar o mapa

//testes de envio de mensagem ao server--------------------------------------------
buffer_seek(global.player_buffer, buffer_seek_start, 0)			//organizacao do buffer

//buffer_u8: Um inteiro sem sinal de 8 bits. Este é um valor positivo de 0 a 255.
buffer_write(global.player_buffer, buffer_text, data_json)				//escrever conteudo do buffer  buffer_s16: 8 bytes

network_send_udp_raw(global.cliente, global.ip, global.porta, global.player_buffer, buffer_tell(global.player_buffer)) //envio da msg

}