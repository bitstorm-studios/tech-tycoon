extends Node2D

@onready var ui = $HUD/UI
@onready var player = $Player
@onready var scroll_background = $ParallaxBackground

var player_points: int
var player_lifes: int
var game_over_scene = preload("res://scenes/game_over_ui.tscn")

func _ready():
	player_lifes = 3
	player_points = 0
	ui.add_points(player_points)
	
func _process(delta):
	scroll_background.offset.x -= 200*delta
	if scroll_background.offset.x <= - get_viewport().get_window().size.x:
		scroll_background.offset.x = 0

func _on_spawn_container_spawn_enemy(enemy):
	enemy.connect("give_points", on_give_points)
	$SpawnContainer.add_child(enemy) # adiciona o inimigo gerado como no filho de spawn_container

func on_give_points(points: int):
	$HitSound.play()
	player_points += points
	ui.add_points(player_points)

func _on_player_took_damage():
	player_lifes -= 1
	ui.set_lifes(player_lifes)
	if player_lifes == 0:
		player.die()
		$ExplodeSound.play()
		var game_over_instance = game_over_scene.instantiate()
		await get_tree().create_timer(0.5).timeout
		game_over_instance.add_points(player_points)
		ui.add_child(game_over_instance)
