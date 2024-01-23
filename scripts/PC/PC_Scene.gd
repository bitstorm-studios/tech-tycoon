extends Control

var catch_tutorial:PackedScene = preload("res://scenes/Catch Game/Tutorial.tscn")
var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")
var space_shooter_tutorial:PackedScene = preload("res://scenes/Space Shooter/Tutorial.tscn")
var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")
var box_scene:PackedScene = preload("res://scenes/DragDrop/DragDrop.tscn")
var ram = load("res://assets/PC/PC-hd.png")
var checkbox_complete = preload("res://assets/PC/task_completed.png")
var target_money: float
var target_fame: float
var current_money: float
var current_fame: float
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
	missing_parts += 1
	if missing_parts == 4:
		var box_instance = box_scene.instantiate()
		add_child(box_instance)		

func _on_cpu_button_pressed():
	get_node("Panel/PC/CPU").texture_normal = null
	get_node("Panel/PC/CPU").disabled = true
	get_node("Panel/PC/CPU").set_default_cursor_shape(CURSOR_ARROW)
	lauch_space_shooter()
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_3_container/CheckBox3").texture = checkbox_complete
	check_finish()

func _on_hd_button_pressed():
	get_node("Panel/PC/HD").texture_normal = null
	get_node("Panel/PC/HD").disabled = true
	get_node("Panel/PC/HD").set_default_cursor_shape(CURSOR_ARROW)
	launch_catch_game()
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_1_container/CheckBox1").texture = checkbox_complete
	check_finish()

func _on_ram_button_pressed():
	get_node("Panel/PC/RAM").texture_normal = null
	get_node("Panel/PC/RAM").disabled = true
	get_node("Panel/PC/RAM").set_default_cursor_shape(CURSOR_ARROW)
	get_node("Panel/Mesa/Tasks_panel/Tasks_container/Task_2_container/CheckBox2").texture = checkbox_complete
	check_finish()

func _on_gpu_button_pressed():
	get_node("Panel/PC/GPU").texture_normal = null
	get_node("Panel/PC/GPU").disabled = true
	get_node("Panel/PC/GPU").set_default_cursor_shape(CURSOR_ARROW)
	check_finish()


func _on_fonte_pressed():
	get_node("Panel/PC/Fonte").texture_normal = null
	get_node("Panel/PC/Fonte").disabled = true
	get_node("Panel/PC/Fonte").set_default_cursor_shape(CURSOR_ARROW)
	check_finish()
	
func _remove_money(value):
	target_money = get_node("/root/Game/MainClient/Dialog/Text").money_payment + value
	current_money = get_node("/root/Game/MainClient/Dialog/Text").money_payment
	$Panel/Mesa/Tasks_panel/Preview/Money_Remove.start()
	
func _remove_fame(value):
	target_fame = get_node("/root/Game/MainClient/Dialog/Text").fame_payment + value
	current_fame = get_node("/root/Game/MainClient/Dialog/Text").fame_payment
	$Panel/Mesa/Tasks_panel/Preview/Fame_Remove.start()
	
func _on_money_remove_timeout():
	if current_money > target_money:
		$Panel/Mesa/Tasks_panel/Preview/MoneyPrev.text = str(current_money)
		print(current_money)
		print(target_money)
		current_money -= 1
	if current_money == target_money:
		print("aqui")
		$Panel/Mesa/Tasks_panel/Preview/MoneyPrev.text = str(current_money)
		get_node("/root/Game/MainClient/Dialog/Text").money_payment = target_money
		$Panel/Mesa/Tasks_panel/Preview/Money_Remove.stop()
		print(get_node("/root/Game/MainClient/Dialog/Text").money_payment)
		
func _on_fame_remove_timeout():
	if current_fame > target_fame:
		$Panel/Mesa/Tasks_panel/Preview/FamePrev.text = str(current_fame)
		current_fame -= 1
	if current_fame == target_fame:
		$Panel/Mesa/Tasks_panel/Preview/FamePrev.text = str(current_fame)
		get_node("/root/Game/MainClient/Dialog/Text").fame_payment = target_fame
		$Panel/Mesa/Tasks_panel/Preview/Fame_Remove.stop()
