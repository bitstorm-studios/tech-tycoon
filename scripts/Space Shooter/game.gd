extends Node2D

@onready var ui = $HUD/UI
@onready var player = $Player
@onready var scroll_background = $ParallaxBackground
@onready var enemy1 = $Enemy
@onready var enemy2 = $Enemy2
@onready var enemy3 = $Enemy3
@onready var enemy4 = $Enemy4
@onready var enemy5 = $Enemy5
@onready var enemy6 = $Enemy6

var player_points: int
var player_lifes: int
var game_over_scene = preload("res://scenes/Space Shooter/game_over_ui.tscn")
var win_scene = preload("res://scenes/Space Shooter/Win.tscn")

func _ready():
	player_lifes = 3
	player_points = 0
	ui.add_points(player_points)
	enemy1.connect("give_points", on_give_points)
	enemy2.connect("give_points", on_give_points)
	enemy3.connect("give_points", on_give_points)
	enemy4.connect("give_points", on_give_points)
	enemy5.connect("give_points", on_give_points)
	enemy6.connect("give_points", on_give_points)
	
func _process(delta):
	scroll_background.offset.y += 169*delta
	if scroll_background.offset.y >= get_viewport().get_window().size.y:
		scroll_background.offset.y = 0

func on_give_points(points: int):
	$HitSound.play()
	player_points += points
	ui.add_points(player_points)
	if player_points == 6:
		get_tree().paused = true
		var win_instance = win_scene.instantiate()
		ui.add_child(win_instance) 

func _on_player_took_damage():
	$HitSound.play()
	player_lifes -= 1
	ui.set_lifes(player_lifes)
	if player_lifes == 0:
		get_tree().paused = true
		player.die()
		$ExplodeSound.play()
		var game_over_instance = game_over_scene.instantiate()
		ui.add_child(game_over_instance)
