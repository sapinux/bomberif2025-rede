global.cliente = network_create_socket(network_socket_udp)	//tipo de conexao com o server
global.ip = "200.131.5.41"		//ip do server
global.porta = 62832		//porta utilizada para enviar p o server
global.size = 60			//tamanho do pacote em bytes

network_connect_raw(global.cliente, global.ip, global.porta)					//conexao do cliente c o server
global.player_buffer = buffer_create(global.size, buffer_fixed, global.size)	//buffer da mensagem ao server

global.sala_number = noone		//receber o numero da sala
global.player_number = noone	//receber o numero do player

enum msg_type {	//maquina de estados
	CRIAR_SALA,
	JOIN_HOST,
	STOP_HOST,
	SET_PLAYER_STAT
} 