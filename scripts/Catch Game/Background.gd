extends Node2D

var collectable_scene: PackedScene = preload("res://scenes/Catch Game/Falling_Collectable.tscn")
var obstacle_scene: PackedScene = preload("res://scenes/Catch Game/Falling_Obstacle.tscn")
var win_scene: PackedScene = preload("res://scenes/Catch Game/Win.tscn")
var lose_scene:PackedScene = preload("res://scenes/Catch Game/Lose.tscn")
var player_scene:PackedScene = preload("res://scenes/Catch Game/Player.tscn")
var interval = 0.3
var player_points = 0
var player_life = 3

func _ready():
	$Timer.start(interval)
	var player_instance = player_scene.instantiate()
	var spawn_position: Node2D = $Marker2D
	player_instance.global_position = spawn_position.global_position
	add_child(player_instance)

func _on_timer_timeout():
	var screen = get_viewport_rect().size 
	var position_obj = Vector2(randf_range(0, screen.x), -100)
	var position_obj2 = Vector2(randf_range(0, screen.x), -100)
	
	var collectable_instance = collectable_scene.instantiate()
	
	collectable_instance.position = position_obj
	collectable_instance.connect("collect", on_collect)

	add_child(collectable_instance)
	
	var obstacle_instance = obstacle_scene.instantiate()
	
	obstacle_instance.position = position_obj2
	obstacle_instance.connect("decrease", on_decrease)
	
	add_child(obstacle_instance)
	
func on_collect():
	player_points += 1
	if (player_points == 5):
		get_tree().paused = true
		var win_instance = win_scene.instantiate()
		add_child(win_instance) 
		
	$HUD.show_points(player_points)

func on_decrease():
	player_life -= 1
	if (player_life == 0):
		get_tree().paused = true
		var lose_instance = lose_scene.instantiate()
		add_child(lose_instance) 
		
	$HUD.show_life(player_life)
