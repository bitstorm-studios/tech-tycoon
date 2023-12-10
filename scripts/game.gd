extends Node2D

@onready var path = $MainClient/Path2D/PathFollow2D
@onready var timer = $MainClient/Timer
var client_scene = preload("res://scenes/Clients/Client.tscn")
var client_instance
var dialog_scene = preload("res://scenes/Dialog/Dialog.tscn")

func _ready():
	client_instance = client_scene.instantiate()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").add_child(client_instance)

func _physics_process(delta: float):
	const move_speed = 350
	path.progress += move_speed * delta
			
	if path.progress_ratio > 0.49 and path.progress_ratio < 0.5:
		set_physics_process(false)
		path.progress_ratio = 0.51
		_show_dialog()
		
	if path.progress_ratio == 1:
		set_physics_process(false)
		print(path.progress_ratio)
		path.progress_ratio = 0
		get_node("/root/Game/MainClient/Path2D/PathFollow2D").remove_child(client_instance)
		timer.start()

func _show_dialog():
	var dialog_instance = dialog_scene.instantiate()
	get_node("/root/Game/MainClient").add_child(dialog_instance)
	var dialog = get_node("/root/Game/MainClient/Dialog/Text")
	dialog.show_message()


func _on_timer_timeout():
	set_physics_process(true)
	_ready()
