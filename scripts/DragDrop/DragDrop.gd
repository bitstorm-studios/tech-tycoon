extends TextureRect

func _get_drag_data(_at_position):
	var preview_texture = TextureRect.new()

	preview_texture.texture = texture
	preview_texture.scale = Vector2(0.8,0.8)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null	
	
	return preview_texture.texture
	
func _can_drop_data(_at_position, data):
	return data is Texture2D
	
func _drop_data(_at_position, data):
	texture = data
