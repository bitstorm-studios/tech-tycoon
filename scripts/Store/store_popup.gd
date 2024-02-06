extends Control

@export var item_comprado:int
@export var valor_gold:int
@export var valor_rep:int

func can_buy():
	var gold = get_node("/root/Game").money
	var rep = get_node("/root/Game").fame
	if gold >= valor_gold and rep >= valor_rep:
		return true
	else:
		return false

func update_gold():
	get_node("/root/Game/HUD/Stats")._remove_money(-(valor_gold))

func _on_fechar_pressed():
	self.queue_free()


func _on_cancelar_pressed():
	self.queue_free()


func _on_comprar_pressed():
	match item_comprado:
		0:
			print("Biblia")
			if can_buy():
				get_parent().get_child(1).get_child(1).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(1).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				get_node("/root/Game").add_padre()
				get_node("/root/Game").item_biblia = true
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		1:
			print("Desmemoralizador")
			if can_buy():
				get_parent().get_child(1).get_child(2).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(2).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				get_node("/root/Game").item_neuralyzer = true
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		2:
			print("Ovo de Alien")
			if can_buy():
				get_parent().get_child(1).get_child(3).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(3).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		3:
			print("Oculos")
			if can_buy():
				get_parent().get_child(1).get_child(4).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(4).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				get_node("/root/Game").item_oculos = true
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		4:
			print("Dinheiros")
			if can_buy():
				get_parent().get_child(1).get_child(5).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(5).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				get_node("/root/Game").item_dinheiro = true
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		5:
			print("Necronomicon")
			if can_buy():
				get_parent().get_child(1).get_child(6).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(6).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		6:
			print("Ps5")
			if can_buy():
				get_parent().get_child(1).get_child(7).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(7).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
		7:
			print("Arc")
			if can_buy():
				get_parent().get_child(1).get_child(8).disabled = true #desabilita o botão
				get_parent().get_child(1).get_child(8).set_default_cursor_shape(0) #muda o mouse pra setinha
				self.queue_free()
				update_gold()
			else:
				get_child(0).get_child(3).text = "Valores insuficientes!"
