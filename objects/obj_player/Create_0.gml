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


scr_enviar("x", x)		//executar script de envio
scr_enviar("y", y)		//executar script de envio
scr_enviar("id", id)	//executar script de envio