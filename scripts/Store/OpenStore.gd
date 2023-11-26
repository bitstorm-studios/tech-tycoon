extends Button

var store_scene: PackedScene = preload("res://scenes/Store/store.tscn")

func _on_pressed():
	var store_scene_instantiate = store_scene.instantiate()
	get_tree().paused = true
	get_tree().get_root().add_child(store_scene_instantiate)
