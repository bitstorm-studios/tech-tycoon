extends Button

var PC_scene: PackedScene = preload("res://scenes/PC/PC.tscn")

func _on_pressed():
	var client_main = get_node("/root/Game/MainClient")
	client_main.hide()
	var PC_scene_instantiate = PC_scene.instantiate()
	get_tree().get_root().get_node("/root/Game/MainPC").add_child(PC_scene_instantiate)
