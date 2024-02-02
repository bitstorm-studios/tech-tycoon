extends Control

@onready var game = preload("res://scenes/game.tscn")

func _on_texture_button_pressed():
	var game_instance = game.instantiate()
	get_tree().get_root().add_child(game_instance)
	hide()
