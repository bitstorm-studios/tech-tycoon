extends Control

var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")
var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")
var finish_scene:PackedScene = preload("res://scenes/PC/Conclude.tscn")
var pendent_tasks = 2

func _on_tampa_button_pressed():
	get_node("Panel/PC/Tampa").queue_free()
	
func lauch_space_shooter():
	var space_shooter_scene_instantiate = space_shooter_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(space_shooter_scene_instantiate)
	get_node("/root/Game/HUD").hide()

func launch_catch_game():
	var catch_game_scene_instantiate = catch_game_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(catch_game_scene_instantiate)
	get_node("/root/Game/HUD").hide()

func check_finish():
	pendent_tasks -= 1
	if pendent_tasks == 0:
		var finish_intance = finish_scene.instantiate()
		get_node("Panel/Mesa/Tasks_panel/Finish_container").add_child(finish_intance)

func _on_cpu_button_pressed():
	get_node("Panel/PC/CPU").hide()
	get_node("Panel/PC/Button_container/CPU_button").queue_free()
	lauch_space_shooter()
	check_finish()

func _on_hd_button_pressed():
	get_node("Panel/PC/HD").hide()
	get_node("Panel/PC/Button_container/HD_button").queue_free()
	launch_catch_game()
	check_finish()

func _on_ram_button_pressed():
	get_node("Panel/PC/RAM").hide()
	get_node("Panel/PC/Button_container/RAM_button").queue_free()
	check_finish()

func _on_gpu_button_pressed():
	get_node("Panel/PC/GPU").hide()
	get_node("Panel/PC/Button_container/GPU_button").queue_free()
	check_finish()
