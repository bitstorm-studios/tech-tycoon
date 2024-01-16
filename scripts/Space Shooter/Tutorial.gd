extends Control

var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")

func _on_começar_pressed():
	var space_shooter_instantiate = space_shooter_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(space_shooter_instantiate)
	self.queue_free()
