extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Happy_Larry.png"), load("res://assets/Clients/Larry_Bravo.png"),
				   load("res://assets/Clients/Larry.png")]
	$Sprite.texture = sprites[sprite]

func choose_message():
	match accepted:
		0:
			message = "Olá, me chamo Larry, trabalho na empresa X com banco de dados, gostaria que você trocasse o HD desde computador"
		1:
			message = "Preciso da sua ajuda ! Fiz besteira com os dados da empresa, posso deixar o mainframe aqui com você ?"
		2:
			message = "Pronto consegui arrumar o backup e ninguém me descobriu, agora posso devolver o mainframde. Poderia devolve-lo ?"
		3:
			message = "Aqui sua recompensa"
			
func reaction():
	match accepted:
		0:
			message = "Muito obrigado"
		1:
			message = "Obrigado, logo mais eu voltarei"
		2:
			message = "Excelente, amanhã eu volto e te darei uma recompensa"
