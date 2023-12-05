extends Button

var PC_scene: PackedScene = preload("res://scenes/PC/PC.tscn")

func _on_pressed():
	var PC_scene_instantiate = PC_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(PC_scene_instantiate)
