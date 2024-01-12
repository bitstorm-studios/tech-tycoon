extends HBoxContainer

func _add_fame(value):
	get_node("/root/Game").fame += value
	$ReputationValue.text = str(get_node("/root/Game").fame)
	
func _remove_fame(value):
	get_node("/root/Game").fame += value
	$ReputationValue.text = str(get_node("/root/Game").fame)
