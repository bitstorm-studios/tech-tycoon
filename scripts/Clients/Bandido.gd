extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool
@export var answer:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Happy_Larry.png"), load("res://assets/Clients/Larry_Bravo.png"),
				   load("res://assets/Clients/Larry.png")]
	$Sprite.texture = sprites[sprite]

func choose_message():
	match accepted:
		0:
			message = "Ei, seguinte, soube que você é bom em ajudar as pessoas, me ajude que você não irá se arrepender"
		1:
			message = "Você parece confiável, guarde este pendrive até eu voltar"
		2:
			message = "Ótimo, você é firmeza, mais um serviço e depois eu sumo, só preciso que dê um jeito no que tem nesse HD aqui"
			
func reaction():
	match accepted:
		0:
			message = "Valeu meu chapa"
		1:
			if answer:
				message = "Daqui uns dias tô de volta"
			else:
				message = "Achei que você fosse parceiro"
		2:
			message = "Você é o cara! Tá aqui sua parte"
