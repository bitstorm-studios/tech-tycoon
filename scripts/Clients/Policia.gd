extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool
@export var saw_sus:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Happy_Larry.png"), load("res://assets/Clients/Larry_Bravo.png"),
				   load("res://assets/Clients/Larry.png")]
	$Sprite.texture = sprites[sprite]

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
