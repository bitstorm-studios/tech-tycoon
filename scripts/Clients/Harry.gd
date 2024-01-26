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
			message = "Bom dia, me chamo Harry, quero que você arrume a fonte deste computador"
		1:
			message = "Certo, preciso que você me ajude com um código mal feito. Se você não atrapalhar lhe darei uma recompensa"
			
func reaction():
	match accepted:
		0:
			message = "Vejo que você não é um inútil completo, tenho um trabalho pra fazer e talvez você possa me ajuda"
		1:
			message = "Código funcionando, aqui sua recompensa"
