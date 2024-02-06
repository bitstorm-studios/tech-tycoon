extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Harry/Happy.png"), load("res://assets/Clients/Harry/Angry.png"),
				   load("res://assets/Clients/Harry/Neutral.png")]
	$Harry.texture = sprites[sprite]
	
func add_one():
	accepted += 1

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
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Harry.tscn"))
