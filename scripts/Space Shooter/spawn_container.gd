extends Node2D

signal spawn_enemy(enemy)
@onready var spawn_positions: Node2D = $SpawnPosition
var enemy_scene: PackedScene = preload("res://scenes/enemy.tscn")

func _on_timer_timeout():
	var spawn_position_array = spawn_positions.get_children() #armazenar tudo que esta no no spawn_positions em um array
	var random_position: Node2D = spawn_position_array.pick_random() # escolhe um no filho aleatorio para spawnar o inimigo
	var enemy_instance = enemy_scene.instantiate() #aloca os recursos para o inimigo
	enemy_instance.global_position = random_position.global_position # define a posiçao aleatoria para a nova instancia de inimigo
	emit_signal("spawn_enemy", enemy_instance) 
