extends Control

var target_money: float
var target_fame: float
var current_money: float
var current_fame: float

func _add_money(value):
	target_money = get_node("/root/Game").money + value
	current_money = get_node("/root/Game").money
	$Money_Add.start()
	$PopUpPosition.popup()
	get_child(9).money_value(value)
		
func _remove_money(value):
	target_money = get_node("/root/Game").money + value
	get_node("/root/Game").money += value
	current_money = get_node("/root/Game").money
	$Money_Remove.start()
	$PopUpPosition.popup()
	get_child(9).money_value(value)
	
func _add_fame(value):
	target_fame = get_node("/root/Game").fame + value
	get_node("/root/Game").fame += value
	current_fame = get_node("/root/Game").fame
	$Fame_Add.start()
	$PopUpPosition.popup()
	get_child(9).fame_value(value)
	
func _remove_fame(value):
	target_fame = get_node("/root/Game").fame + value
	get_node("/root/Game").fame += value
	current_fame = get_node("/root/Game").fame
	$Fame_Remove.start()
	$PopUpPosition.popup()
	get_child(9).fame_value(value)

func _on_money_add_timeout():
	if current_money < target_money:
		$MoneyValue.text = str(current_money)
		current_money += 1
	if current_money == target_money:
		get_node("/root/Game").money = target_money
		$MoneyValue.text = str(current_money)
		$Money_Add.stop()

func _on_money_remove_timeout():
	if current_money > target_money:
		$MoneyValue.text = str(current_money)
		current_money -= 1
	if current_money == target_money:
		get_node("/root/Game").money = target_money
		$MoneyValue.text = str(current_money)
		$Money_Remove.stop()

func _on_fame_add_timeout():
	if current_fame < target_fame:
		$ReputationValue.text = str(current_fame)
		current_fame += 1
	if current_fame == target_fame:
		get_node("/root/Game").fame = target_fame
		$ReputationValue.text = str(current_fame)
		$Fame_Add.stop()

func _on_fame_remove_timeout():
	if current_fame > target_fame:
		$ReputationValue.text = str(current_fame)
		current_fame -= 1
	if current_fame == target_fame:
		$ReputationValue.text = str(current_fame)
		$Fame_Remove.stop()
