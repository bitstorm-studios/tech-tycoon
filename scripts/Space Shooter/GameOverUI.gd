extends Control

var space_scene = preload("res://scenes/Space Shooter/game.tscn")

func _on_button_pressed():
	get_tree().paused = false
	var space_instance = space_scene.instantiate()
	get_parent().queue_free()
	get_tree().get_root().get_node("/root/Game").add_child(space_instance)
