extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Padre/Happy.png"), load("res://assets/Clients/Padre/Angry.png"),
				   load("res://assets/Clients/Padre/Neutral.png")]
	$Padre.texture = sprites[sprite]
	
func add_one():
	accepted += 1

func choose_message():
	match accepted:
		0:
			message = "Padre msg 1"
		1:
			message = "Padre msg 2"
		2:
			message = "Padre msg 3"
			
func reaction():
	match accepted:
		0:
			message = "Padre react 1"
		1:
			message = "Padre react 2"
		2:
			message = "Padre react 3"
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Padre.tscn"))
	
