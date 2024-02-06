extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Garry/Happy.png"), load("res://assets/Clients/Garry/Angry.png"),
				   load("res://assets/Clients/Garry/Neutral.png")]
	$Garry.texture = sprites[sprite]
	
func add_one():
	accepted += 1

func choose_message():
	match accepted:
		0:
			message = "Oi, eu sou o Harry, meu PC esta lento, de ua olhada por favor"
		1:
			message = "Será que hoje poderia me ajudar com um app ?"
		2:
			message = "As vendas do app foram incríveis, tome aqui a sua parte"
			
func reaction():
	match accepted:
		0:
			message = "Você me ajudou muito, memoria RAM, quem diria."
		1:
			message = "Muito obrigado, você é incrível"
		2:
			message = "Até mais"
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Garry.tscn"))
