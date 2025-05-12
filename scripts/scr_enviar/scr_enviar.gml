function scr_enviar(tipo, valor) {			//argumment0 = tipo de informacao, argumment1 = informacao
//adicionando valor ao mapa--------------------------------------------------------------

global.mapa = ds_map_create();						//criacao do mapa de valores
ds_map_add(global.mapa, tipo, valor)				//adicionar valor no mapa
data_json = json_encode(global.mapa)				//codificar o mapa em json (converter em string)
ds_map_destroy(global.mapa)							//destruicao do mapa de valores

//envio da mensagem p o server----------------------------------------------------------

buffer_seek(global.player_buffer, buffer_seek_start, 0)		//organizacao do buffer

//buffer_text: uma sequencia de caracteres
buffer_write(global.player_buffer, buffer_text, data_json)	//escrever conteudo do buffer

//buffer_tell: envia somente os dados do buffer ignorando o espaço vazio do pacote
network_send_udp_raw(global.cliente, global.ip, global.porta, global.player_buffer, buffer_tell(global.player_buffer)) //envio da msg

}