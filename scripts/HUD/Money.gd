extends HBoxContainer

func _add_money(value):
	get_node("/root/Game").money += value
	$MoneyValue.text = str(get_node("/root/Game").money)
	
func _remove_money(value):
	get_node("/root/Game").money -= value
	$MoneyValue.text = str(get_node("/root/Game").money)
	
