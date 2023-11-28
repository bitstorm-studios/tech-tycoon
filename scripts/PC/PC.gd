extends TextureRect

var catch_game_scene:PackedScene = preload("res://scenes/Catch Game/Background.tscn")
var space_shooter_scene:PackedScene = preload("res://scenes/Space Shooter/game.tscn")

func _on_processador_pressed():
	var catch_game_scene_instantiate = catch_game_scene.instantiate()
	get_tree().get_root().add_child(catch_game_scene_instantiate)


func _on_ram_pressed():
	var space_shooter_scene_instantiate = space_shooter_scene.instantiate()
	get_tree().get_root().add_child(space_shooter_scene_instantiate)


func _on_tampa_button_pressed():
	get_node("Tampa").hide()
