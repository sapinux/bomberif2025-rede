global.cliente = network_create_socket(network_socket_udp)	
global.ip = "127.0.0.1"	//ip do server
global.porta = 58333	//porta utilizada para enviar ao server
global.size = 1		//tamanho do pacote em bytes
network_connect_raw(global.cliente, global.ip, global.porta)	//conexao do cliente ao server
global.player_buffer = buffer_create(global.size, buffer_fixed, global.size)	//buffer da mensagem ao server - 100 bytes