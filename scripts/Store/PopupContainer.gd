extends Marker2D

@export var popup_node: PackedScene

func open_popup():
	var popup = popup_node.instantiate()
	popup.position = global_position
	get_parent().add_child(popup)
	print("alo")
