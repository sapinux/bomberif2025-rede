function scr_enviar(argument0, argument1) {
//adicionando valor ao mapa

ds_map_add(global.data, argument0, argument1)		//adicionar informacao no mapa
data_json = json_encode(global.data)				//converter o mapa em json que é uma string
ds_map_clear(global.data)							//limpar o mapa

//envio da mensagem p o server
buffer_seek(global.player_buffer, buffer_seek_start, 0)		//organizacao do buffer

//buffer_text: uma sequencia de caracteres
buffer_write(global.player_buffer, buffer_text, data_json)	//escrever conteudo do buffer

//envio da msg
network_send_udp_raw(global.cliente, global.ip, global.porta, global.player_buffer, buffer_tell(global.player_buffer))

}