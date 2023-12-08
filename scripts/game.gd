extends Node2D

@onready var path = $MainClient/Path2D/PathFollow2D
var dialog_scene = preload("res://scenes/Dialog/Dialog.tscn")

func _physics_process(delta: float):
	const move_speed = 350
	path.progress += move_speed * delta
	
	if path.progress_ratio == 1:
		_show_dialog()

func _show_dialog():
	set_physics_process(false)
	var dialog_instance = dialog_scene.instantiate()
	get_tree().get_root().get_node("/root/Game/MainClient").add_child(dialog_instance)
	var dialog = get_node("MainClient/Dialog/Text")
	dialog.show_message()
