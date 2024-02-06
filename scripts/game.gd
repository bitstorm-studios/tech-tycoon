extends Node2D

@onready var path = $MainClient/Path2D/PathFollow2D
@onready var timer = $MainClient/Timer
@export var is_walking = true
@export var money: int = 0
@export var fame: int = 0
@export var lifes: int = 3
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

var Padre = preload("res://scenes/Clients/Padre.tscn")

var Larry_instance = Larry.instantiate()
var Harry_instance = Harry.instantiate()
var Jerry_instance = Jerry.instantiate()
var Garry_instance = Garry.instantiate()
var Bandido_instance = Bandido.instantiate()
var Policial_instance = Policial.instantiate()
@export var client_array = [Larry_instance, Harry_instance, Jerry_instance, Garry_instance, Bandido_instance, Policial_instance]
@export var standard_array = [Larry_instance, Harry_instance, Jerry_instance, Garry_instance, Bandido_instance, Policial_instance]
var choosen_client
var dialog_scene = preload("res://scenes/Dialog/Dialog.tscn")
var day_scene = preload("res://scenes/DayTransition.tscn")
var game_over = preload("res://scenes/GameOver.tscn")
var has_stopped = false

#Variaveis de itens comprados na loja que geram multiplicadores
var item_biblia = false
var item_neuralyzer = false
var item_oculos = false
var item_dinheiro = false

func add_padre():
	var Padre_instance = Padre.instantiate()
	standard_array.append(Padre_instance)
	print("Padre adicionado ao standard array")

func _ready():
	_create_client()
	
func _process(_delta):
	if standard_array.is_empty():
		var game_over_instance = game_over.instantiate()
		get_node("/root").add_child(game_over_instance)

func _create_client():
	choosen_client = client_array.pick_random()
	client_array.erase(choosen_client)
	is_walking = true
	has_stopped = false
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").add_child(choosen_client)
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").change_sprite(2)

func _physics_process(delta: float):
	const move_speed = 350
	if is_walking:
		path.progress += move_speed * delta
			
	if path.progress_ratio > 0.49 and not has_stopped:
		has_stopped = true
		_show_dialog()
		
	if path.progress_ratio == 1:
		_new_client()

func _show_dialog():
	is_walking = false
	var dialog_instance = dialog_scene.instantiate()
	get_node("/root/Game/MainClient").add_child(dialog_instance)
	var dialog = get_node("/root/Game/MainClient/Dialog/Text")
	get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").choose_message()
	dialog.show_message(get_node("/root/Game/MainClient/Path2D/PathFollow2D/Client").message)
	
func _new_client():
	print(standard_array.size())
	get_node("/root/Game/MainClient/Path2D/PathFollow2D").remove_child(choosen_client)
	path.progress_ratio = 0
	is_walking = false
	client += 1
	if client == 5:
		end_day()
		client = 0
	timer.start()

func _on_timer_timeout():
	_create_client()

func end_day():
	var day_instance = day_scene.instantiate()
	get_node("/root").add_child(day_instance)
	get_node("/root/DayTransition").change_day(day)
	day += 1
	client_array = standard_array
