extends TextureButton

var finish_scene:PackedScene = preload("res://scenes/PC/Conclude.tscn")

func _can_drop_data(_at_position, data):
	if data["origin_texture"] == load("res://assets/DragDrop/PC-placa-de-video.png"):
		get_node("/root/Game/MainPC/PC/DragDrop/Box").possible_parts.erase(load("res://assets/DragDrop/PC-placa-de-video.png"))
		return true
	else:
		return false

func _drop_data(_at_position, data):
	texture_normal = data["origin_texture"]
	if get_node("/root/Game/MainPC/PC/DragDrop/Box").possible_parts.size() == 0:
		var finish_intance = finish_scene.instantiate()
		get_node("/root/Game/MainPC/PC/Panel/Mesa/Tasks_panel/Tasks_container/Finish_container").add_child(finish_intance)
