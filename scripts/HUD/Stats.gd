extends Control

func _add_money(value):
	get_node("/root/Game").money += value
	$MoneyValue.text = str(get_node("/root/Game").money)
	
func _remove_money(value):
	get_node("/root/Game").money -= value
	$MoneyValue.text = str(get_node("/root/Game").money)
	
func _add_fame(value):
	get_node("/root/Game").fame += value
	$ReputationValue.text = str(get_node("/root/Game").fame)
	
func _remove_fame(value):
	get_node("/root/Game").fame += value
	$ReputationValue.text = str(get_node("/root/Game").fame)
