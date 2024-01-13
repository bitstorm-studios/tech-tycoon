extends Control

@onready var fundo = $AnimatedSprite2D
@onready var pontos = get_node

func show_points():
	fundo.frame += 1
	
func show_life():
	fundo.frame -= 1
	get_node("/root/Game/CatchGame").player_points -= 1
