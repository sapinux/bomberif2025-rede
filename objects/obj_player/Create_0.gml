//obs: variaveis globais sao definidas no obj_game_config
vel = global.player_velocidade;			//velocidade em pixels
bombas = global.bombas					//quantidade  de bombas
poder_bomba = global.poder_bomba		//alcance da explosao
vivo = true								//situacao de vida
chutar_bomba = global.chutar_bomba		//poder para chutar a bomba
luva = global.luva						//poder para lancar a bomba
direcao = "baixo"						//direcao padrao do player
global.id_pai = id						//player criador da bomba
imagem = []								//vetor para alocar os sprites do player
script_execute(scr_carregar_sprites)	//carregar sprites no vetor
sprite_index = imagem[1]				//carrega sprite basica




//testes de envio de mensagem ao server--------------------------------------------
buffer_seek(global.player_buffer, buffer_seek_start, 0)			//organizacao do buffer

//buffer_u8: Um inteiro sem sinal de 8 bits. Este é um valor positivo de 0 a 255.
buffer_write(global.player_buffer, buffer_u8, 86)				//escrever conteudo do buffer 

network_send_udp_raw(global.cliente, global.ip, global.porta, global.player_buffer, global.size) //envio da msg