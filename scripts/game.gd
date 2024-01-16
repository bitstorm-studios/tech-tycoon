extends Node2D

@onready var path = $MainClient/Path2D/PathFollow2D
@onready var timer = $MainClient/Timer
@export var is_walking = true
@export var money = 0
@export var fame = 0
@export var first_time_shooter = true
@export var first_time_catch = true
@export var lifes = 3
var client_scene = preload("res://scenes/Clients/Client.tscn")
var client_instance
var dialog_scene = preload("res://scenes/Dialog/Dialog.tscn")
var has_stopped = false
var message = "Olá, meu computador está muito lento, quero que você formate ele e instale uma nova memória RAM."

func _ready():
	_create_client()

func _create_client():
	is_walking = true
	has_stopped = false
	client_instance = client_scene.instantiate()
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").add_child(client_instance)

func _physics_process(delta: float):
	const move_speed = 350
	if is_walking:
		path.progress += move_speed * delta
			
	if path.progress_ratio > 0.49 and not has_stopped:
		has_stopped = true
		_show_dialog()
		
	if path.progress_ratio == 1:
		timer.start()
		_new_client()

func _show_dialog():
	is_walking = false
	var dialog_instance = dialog_scene.instantiate()
	get_node("/root/Game/MainClient").add_child(dialog_instance)
	var dialog = get_node("/root/Game/MainClient/Dialog/Text")
	dialog.show_message(message)
	
func _new_client():
	path.progress_ratio = 0
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").remove_child(client_instance)
	is_walking = false

func _on_timer_timeout():
	_create_client()
