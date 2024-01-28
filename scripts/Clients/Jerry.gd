extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Jerry/Happy.png"), load("res://assets/Clients/Jerry/Angry.png"),
				   load("res://assets/Clients/Jerry/Neutral.png")]
	$Jerry.texture = sprites[sprite]

func choose_message():
	match accepted:
		0:
			message = "Meu computador tem se comportado estranho, poderia dar uma olhada ?"
		1:
			message = "Meu computador tem se comportado estranho, poderia dar uma olhada ?"
		2:
			message = "Meu computador tem se comportado estranho, poderia dar uma olhada ?"
		3:
			message = "Meu computador tem se comportado estranho, poderia dar uma olhada ?"
			
func reaction():
	match accepted:
		0:
			message = "Virus ?? Que loucura"
		1:
			message = "Virus ?? Que loucura"
		2:
			message = "Virus ?? Que loucura"
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standar_array.erase(preload("res://scenes/Clients/Jerry.tscn"))
