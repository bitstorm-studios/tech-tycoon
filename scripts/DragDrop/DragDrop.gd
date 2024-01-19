extends TextureRect

@export var possible_parts = [load("res://assets/DragDrop/PC-hd.png"), load("res://assets/DragDrop/PC-placa-de-video.png"), 
							  load("res://assets/DragDrop/PC-processador.png"), load("res://assets/DragDrop/PC-ram.png")]

func _get_drag_data(_at_position):
	var data = {}
	
	var preview_texture = TextureRect.new()
	preview_texture.texture = possible_parts.pick_random()
	
	data["origin_texture"] = preview_texture.texture
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	
	return data
