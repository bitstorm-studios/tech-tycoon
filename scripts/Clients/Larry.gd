extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Larry/Happy_Larry.png"), load("res://assets/Clients/Larry/Larry_Bravo.png"),
				   load("res://assets/Clients/Larry/Larry.png")]
	$Larry.texture = sprites[sprite]
	
func add_one():
	accepted += 1

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
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Larry.tscn"))
