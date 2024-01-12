extends Control

var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")

func _on_começar_pressed():
	var catch_game_instantiate = catch_game_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(catch_game_instantiate)
	self.queue_free()
