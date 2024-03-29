extends Control

@onready var popup_scene = preload("res://scenes/Store/store_popup.tscn")

#Nomes de cada item que é ofertado na loja
var nomeBiblia = "Biblia"
var nomeNeuralizer = "Desmemoralizador"
var nomeAlienEgg = "Ovo de Alien"
var nomeOculos = "Oculos Maneiro"
var nomeDinheiros = "Saco de dinheiro"
var nomeLivro = "Necronomicon"
var nomePs5 = "PolyStation 5"
var nomeArc = "Reator Arc"

#Sprites que são exibidos no popup
@onready var bibliaPopup = preload("res://assets/Store/BibliaPopup.png")
@onready var neuralizerPopup = preload("res://assets/Store/neuralizerPopup.png")
@onready var alienEggPopup = preload("res://assets/Store/alieneggupPopup.png")
@onready var oculosPopup = preload("res://assets/Store/OculosPopup.png")
@onready var dinheirosPopup = preload("res://assets/Store/DinheirosPopup.png")
@onready var livroPopup = preload("res://assets/Store/LivroPopup.png")
@onready var Ps5Popup = preload("res://assets/Store/PS5Popup.png")
@onready var arcPopup = preload("res://assets/Store/arcupPopup.png")

#Preços de Gold de cada item
var precoGoldBiblia = 10
var precoGoldNeuralizer = 70
var precoGoldAlienEgg = 37
var precoGoldOculos = 60
var precoGoldDinheiros = 1000
var precoGoldLivro = 666
var precoGoldPS5 = 200
var precoGoldArc = 55

#Preços de Rep de cada item
var precoRepBiblia = 3
var precoRepNeuralizer = 30
var precoRepAlienEgg = 0
var precoRepOculos = 0
var precoRepDinheiros = 20
var precoRepLivro = 6
var precoRepPS5 = 20
var precoRepArc = 55

#Descrição de cada item
var descricaoBiblia = "Aumenta o ganho de ouro em 10%\nLibera um novo cliente!"
var descricaoNeuralizer = "Aumenta o ganho de ouro e reputação em 10%\nLibera um novo cliente!"
var descricaoAlienEgg = "Aumenta seu ouro atual em 30%\nLibera um novo cliente!"
var descricaoOculos = "Aumenta o ganho de reputação em 30%"
var descricaoDinheiros = "Aumenta o ganho de ouro em 100%\nLibera um novo cliente!"
var descricaoLivro = "Aumenta seu ouro atual em 50%\nLibera um novo cliente!"
var descricaoPS5 = "Aumenta sua reputação atual em 20%\nLibera um novo cliente!"
var descricaoArc = "Aumenta sua reputação atual em 10%\nLibera um novo cliente!"
	
func instantiate_popup(scene, icon, nome, descricao, precoGold, precoRep):
	var instance = scene.instantiate()
	instance.get_child(0).get_child(0).set_texture(icon)
	instance.get_child(0).get_child(2).text = nome
	instance.get_child(0).get_child(3).text = descricao
	instance.get_child(0).get_child(5).get_child(0).get_child(1).text = str(precoGold)
	instance.get_child(0).get_child(5).get_child(1).get_child(1).text = str(precoRep)
	return instance
	

func _on_bíblia_pressed():
	var popup_instance = instantiate_popup(popup_scene, bibliaPopup, nomeBiblia, descricaoBiblia, precoGoldBiblia, precoRepBiblia)
	popup_instance.item_comprado = 0
	popup_instance.valor_gold = precoGoldBiblia
	popup_instance.valor_rep = precoRepBiblia
	get_parent().add_child(popup_instance)

func _on_neuralyzer_pressed():
	var popup_instance = instantiate_popup(popup_scene, neuralizerPopup, nomeNeuralizer, descricaoNeuralizer, precoGoldNeuralizer, precoRepNeuralizer)
	popup_instance.item_comprado = 1
	popup_instance.valor_gold = precoGoldNeuralizer
	popup_instance.valor_rep = precoRepNeuralizer
	get_parent().add_child(popup_instance)

func _on_alien_egg_pressed():
	var popup_instance = instantiate_popup(popup_scene, alienEggPopup, nomeAlienEgg, descricaoAlienEgg, precoGoldAlienEgg, precoRepAlienEgg)
	popup_instance.item_comprado = 2
	popup_instance.valor_gold = precoGoldAlienEgg
	popup_instance.valor_rep = precoRepAlienEgg
	get_parent().add_child(popup_instance)

func _on_oculos_pressed():
	var popup_instance = instantiate_popup(popup_scene, oculosPopup, nomeOculos, descricaoOculos, precoGoldOculos, precoRepOculos)
	popup_instance.item_comprado = 3
	popup_instance.valor_gold = precoGoldOculos
	popup_instance.valor_rep = precoRepOculos
	get_parent().add_child(popup_instance)

func _on_dinheiro_pressed():
	var popup_instance = instantiate_popup(popup_scene, dinheirosPopup, nomeDinheiros, descricaoDinheiros, precoGoldDinheiros, precoRepDinheiros)
	popup_instance.item_comprado = 4
	popup_instance.valor_gold = precoGoldDinheiros
	popup_instance.valor_rep = precoRepDinheiros
	get_parent().add_child(popup_instance)

func _on_necromicon_pressed():
	var popup_instance = instantiate_popup(popup_scene, livroPopup, nomeLivro, descricaoLivro, precoGoldLivro, precoRepLivro)
	popup_instance.item_comprado = 5
	popup_instance.valor_gold = precoGoldLivro
	popup_instance.valor_rep = precoRepLivro
	get_parent().add_child(popup_instance)

func _on_ps_5_pressed():
	var popup_instance = instantiate_popup(popup_scene, Ps5Popup, nomePs5, descricaoPS5, precoGoldPS5, precoRepPS5)
	popup_instance.item_comprado = 6
	popup_instance.valor_gold = precoGoldPS5
	popup_instance.valor_rep = precoRepPS5
	get_parent().add_child(popup_instance)

func _on_arc_pressed():
	var popup_instance = instantiate_popup(popup_scene, arcPopup, nomeArc, descricaoArc, precoGoldArc, precoRepArc)
	popup_instance.item_comprado = 7
	popup_instance.valor_gold = precoGoldArc
	popup_instance.valor_rep = precoRepArc
	get_parent().add_child(popup_instance)
