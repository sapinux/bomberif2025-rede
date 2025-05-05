global.socket = network_create_socket(network_socket_tcp)
port = "3500"
ip = "127.0.0.1"

check = network_connect_raw(global.socket, ip, port)

if (check != -1) show_message("Conectou")
else show_message("Falhou")