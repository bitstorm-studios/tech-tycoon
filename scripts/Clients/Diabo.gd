extends Control

@export var accepted = 0
@export var message:String
@export var apareceu:bool

func change_sprite(sprite):
	var sprites = [load("res://assets/Clients/Diabo/Happy.png"), load("res://assets/Clients/Diabo/Angry.png"),
				   load("res://assets/Clients/Diabo/Neutral.png")]
	$Diabo.texture = sprites[sprite]
	
func add_one():
	accepted += 1

func choose_message():
	match accepted:
		0:
			message = "Diabo msg 1"
		1:
			message = "Diabo msg 2"
		2:
			message = "Diabo msg 3"
			
func reaction():
	match accepted:
		0:
			message = "Diabo react 1"
		1:
			message = "Diabo react 2"
		2:
			message = "Diabo react 3"
			
func _process(_delta):
	if accepted == 2:
		get_node("/root/Game").standard_array.erase(preload("res://scenes/Clients/Diabo.tscn"))
	
