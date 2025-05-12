global.cliente = network_create_socket(network_socket_udp)	//tipo de conexao com o server
global.ip = "127.0.0.1"		//ip do server
global.porta = 62832		//porta utilizada para enviar p o server
global.size = 50			//tamanho do pacote em bytes

network_connect_raw(global.cliente, global.ip, global.porta)					//conexao do cliente c o server
global.player_buffer = buffer_create(global.size, buffer_fixed, global.size)	//buffer da mensagem ao server

enum msg_type {	//maquina de estados
	CREATE_HOST,
	JOIN_HOST,
	STOP_HOST,
	SET_PLAYER_STAT
} 