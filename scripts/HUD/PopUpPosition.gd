extends Marker2D

@export var values_node: PackedScene

func popup():
	var values = values_node.instantiate()
	values.position = global_position
	get_parent().add_child(values)
