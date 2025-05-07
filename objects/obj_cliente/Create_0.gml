global.cliente = network_create_socket(network_socket_udp)	
global.ip = "127.0.0.1"	//ip do server
global.porta = 58333	//porta utilizada para enviar ao server

network_connect_raw(global.cliente, global.ip, global.porta)	//conexao do cliente ao server
global.player_buffer = buffer_create(100, buffer_fixed, 100)	//buffer da mensagem ao server - 100 bytes