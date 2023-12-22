extends Button

var store_scene: PackedScene = preload("res://scenes/Store/store.tscn")
@onready var open = false

func _on_pressed():	
	if not open:
		var store_scene_instantiate = store_scene.instantiate()
		get_tree().paused = true
		get_tree().get_root().get_node("/root/Game").add_child(store_scene_instantiate)
		open = true
	if open:
		get_tree().get_root().get_node("/root/Game/Store").show()
