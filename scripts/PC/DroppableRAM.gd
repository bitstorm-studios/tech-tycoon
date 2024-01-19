extends TextureRect

func _can_drop_data(_at_position, data):
	if data["origin_texture"] == load("res://assets/DragDrop/PC-ram.png"):
		return true
	else:
		return false

func _drop_data(_at_position, data):
	texture = data["origin_texture"]
