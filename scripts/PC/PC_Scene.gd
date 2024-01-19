extends Control

var catch_tutorial:PackedScene = preload("res://scenes/Catch Game/Tutorial.tscn")
var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")
var space_shooter_tutorial:PackedScene = preload("res://scenes/Space Shooter/Tutorial.tscn")
var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")
var finish_scene:PackedScene = preload("res://scenes/PC/Conclude.tscn")

var ram = load("res://assets/PC/PC-hd.png")

var checkbox_complete = preload("res://assets/PC/task_completed.png")
var pendent_tasks = 2
@export var missing_parts = 0
@export var failed_tasks = 0

func _on_tampa_button_pressed():
	get_node("Panel/PC/Tampa").queue_free()
	
func lauch_space_shooter():
	self.hide()
	var space_shooter_instantiate
	if get_node("/root/Game").first_time_shooter:
		space_shooter_instantiate = space_shooter_tutorial.instantiate()
		get_node("/root/Game").first_time_shooter = false
	elif not get_node("/root/Game").first_time_shooter:
		space_shooter_instantiate = space_shooter_scene.instantiate()
		
	get_tree().get_root().get_node("/root/Game").add_child(space_shooter_instantiate)
	get_node("/root/Game/HUD").hide()

func launch_catch_game():
	self.hide()
	var catch_game_instantiate
	if get_node("/root/Game").first_time_catch:
		catch_game_instantiate = catch_tutorial.instantiate()
		get_node("/root/Game").first_time_catch = false
	elif not get_node("/root/Game").first_time_catch:
		catch_game_instantiate = catch_game_scene.instantiate()
		
	get_tree().get_root().get_node("/root/Game").add_child(catch_game_instantiate)
	get_node("/root/Game/HUD").hide()

func check_finish():
	pendent_tasks -= 1
	if pendent_tasks == 0 && missing_parts == 0:
		var finish_intance = finish_scene.instantiate()
		get_node("Panel/Mesa/Tasks_panel/Tasks_container/Finish_container").add_child(finish_intance)

func _on_cpu_button_pressed():
	get_node("Panel/PC/CPU").texture = null
	get_node("Panel/PC/Button_container/CPU_button").queue_free()
	lauch_space_shooter()
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_3_container/CheckBox3").texture = checkbox_complete
	check_finish()
	missing_parts += 1

func _on_hd_button_pressed():
	get_node("Panel/PC/HD").texture = null
	get_node("Panel/PC/Button_container/HD_button").queue_free()
	launch_catch_game()
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_1_container/CheckBox1").texture = checkbox_complete
	check_finish()
	missing_parts += 1

func _on_ram_button_pressed():
	get_node("Panel/PC/RAM").texture = ram
	get_node("Panel/PC/Button_container/RAM_button").queue_free()
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_2_container/CheckBox2").texture = checkbox_complete
	check_finish()
	missing_parts += 1

func _on_gpu_button_pressed():
	get_node("Panel/PC/GPU").texture = null
	get_node("Panel/PC/Button_container/GPU_button").queue_free()
	check_finish()
	missing_parts += 1
