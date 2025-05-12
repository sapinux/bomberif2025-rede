//obs: variaveis globais sao definidas no obj_game_config
vel = global.player_velocidade;			//velocidade em pixels
bombas = global.bombas					//quantidade  de bombas
poder_bomba = global.poder_bomba		//alcance da explosao
vivo = true								//situacao de vida
chutar_bomba = global.chutar_bomba		//poder para chutar a bomba
luva = global.luva						//poder para lancar a bomba
direcao = "b"							//direcao padrao do player
global.id_pai = id						//player criador da bomba
imagem = []								//vetor para alocar os sprites do player
script_execute(scr_carregar_sprites)	//carregar sprites no vetor
sprite_index = imagem[1]				//carrega sprite basica

//envio de informacos basicas p o server
scr_enviar("x", x)		//enviar x para o server
scr_enviar("y", y)		//enviar y para o server
scr_enviar("id", id)	//enviar id para o server

//show_debug_message(id)