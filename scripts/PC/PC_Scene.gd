extends Control

var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")
var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")
var finish_scene:PackedScene = preload("res://scenes/PC/Conclude.tscn")
var pendent_tasks = 0

func _on_tampa_button_pressed():
	get_node("Panel/PC/Tampa").queue_free()
	if pendent_tasks == 0:
		var finish_intance = finish_scene.instantiate()
		self.add_child(finish_intance)

func _on_ram_button_pressed():
	var space_shooter_scene_instantiate = space_shooter_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(space_shooter_scene_instantiate)
	get_node("Panel/PC/RAM_button").disabled = true
	get_node("/root/Game/MainPC").hide()
	get_node("/root/Game/HUD/Will Hide").hide()
	pendent_tasks -= 1
	if pendent_tasks == 0:
		var finish_intance = finish_scene.instantiate()
		self.add_child(finish_intance)

func _on_processador_button_pressed():
	var catch_game_scene_instantiate = catch_game_scene.instantiate()
	get_tree().get_root().get_node("/root/Game").add_child(catch_game_scene_instantiate)
	get_node("Panel/PC/Processador_button").disabled = true
	get_node("/root/Game/MainPC").hide()	
	get_node("/root/Game/HUD/Will Hide").hide()
	pendent_tasks -= 1
	if pendent_tasks == 0:
		var finish_intance = finish_scene.instantiate()
		self.add_child(finish_intance)

func _on_exit_pc_pressed():
	self.queue_free()
