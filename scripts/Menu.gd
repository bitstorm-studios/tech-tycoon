extends Control

@onready var game = preload("res://scenes/game.tscn")
@onready var day = preload("res://scenes/DayTransition.tscn")

func _on_texture_button_pressed():
	var game_instance = game.instantiate()
	var day_instance = day.instantiate()
	get_tree().get_root().add_child(game_instance)
	get_tree().get_root().add_child(day_instance)
	get_node("/root/DayTransition").change_day(1)
	self.hide()


func _on_texture_button_2_pressed():
	get_tree().quit()
