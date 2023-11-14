extends Node2D

var collectable_scene: PackedScene = preload("res://scenes/Falling_Collectable.tscn")
var obstacle_scene: PackedScene = preload("res://scenes/Falling_Obstacle.tscn")
var win_scene: PackedScene = preload("res://scenes/Win.tscn")
var lose_scene:PackedScene = preload("res://scenes/Lose.tscn")
var interval = 0.8
var player_points = 0
var player_life = 3

func _ready():
	$Timer.start(interval)

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
	if (player_points == 10):
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
