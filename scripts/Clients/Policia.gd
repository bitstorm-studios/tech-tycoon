extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool
@export var saw_sus:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Policial/Happy.png"), load("res://assets/Clients/Policial/Angry.png"),
				   load("res://assets/Clients/Policial/Neutral.png")]
	$Policial.texture = sprites[sprite]

func add_one():
	accepted += 1

func choose_message():
	match accepted:
		0:
			message = "O computador da delegacia tá dando mal contato"
		1:
			message = "Boa tarde cidadão, estou procurando um home, suspeito, ele é procurado por rombos e crimes digitais, o senhor viu alguém estranho ultimamente ?"
		2:
			message = "Encontramos ele, o senhor foi de grande ajuda"
			
func reaction():
	match accepted:
		0:
			message = "Muito obrigado"
		1:
			if saw_sus:
				message = "Obrigado pela descrição"
			else:
				message = "Entendi, tenha um boa dia"
		2:
			message = "Muito obrigado"
				
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Policial.tscn"))
		
