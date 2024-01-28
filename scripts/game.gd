extends Node2D

@onready var path = $MainClient/Path2D/PathFollow2D
@onready var timer = $MainClient/Timer
@export var is_walking = true
@export var money = 0
@export var fame = 0
@export var lifes = 3
@export var first_time_catch = true
@export var first_time_shooter = true
var day = 2
var client = 0
var Larry = preload("res://scenes/Clients/Larry.tscn")
var Harry = preload("res://scenes/Clients/Harry.tscn")
var Jerry = preload("res://scenes/Clients/Jerry.tscn")
var Garry = preload("res://scenes/Clients/Garry.tscn")
var Bandido = preload("res://scenes/Clients/Bandido.tscn")
var Policial = preload("res://scenes/Clients/Policial.tscn")
var standard_array = [preload("res://scenes/Clients/Larry.tscn"), preload("res://scenes/Clients/Harry.tscn"), preload("res://scenes/Clients/Jerry.tscn"),
					preload("res://scenes/Clients/Garry.tscn"), preload("res://scenes/Clients/Bandido.tscn"), preload("res://scenes/Clients/Policial.tscn")]
var client_instance
var dialog_scene = preload("res://scenes/Dialog/Dialog.tscn")
var day_scene = preload("res://scenes/DayTransition.tscn")
var game_over = preload("res://scenes/GameOver.tscn")
var has_stopped = false

func _ready():
	_create_client()
	
func _process(_delta):
	if client == 5:
		end_day()
		client = 0
	
	if standard_array.is_empty():
		var game_over_instance = game_over.instantiate()
		get_node("/root").add_child(game_over_instance)

func _create_client():
	var choosen_client = client_scene.pick_random()
	client_instance = choosen_client.instantiate()
	client_scene.erase(choosen_client)
	is_walking = true
	has_stopped = false
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").add_child(client_instance)
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").change_sprite(2)

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
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").choose_message()
	dialog.show_message(get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").message)
	
func _new_client():
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").remove_child(client_instance)
	path.progress_ratio = 0
	is_walking = false
	client += 1

func _on_timer_timeout():
	_create_client()

func end_day():
	var day_instance = day_scene.instantiate()
	get_node("/root").add_child(day_instance)
	get_node("/root/DayTransition").change_day(day)
	day += 1
	client_scene = standard_array
