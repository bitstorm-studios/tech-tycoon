extends Sprite2D

var sprites = ["res://assets/Cross Road/TopDown Vehicles v1.17/Civic Branco.png", 
"res://assets/Cross Road/TopDown Vehicles v1.17/Civic Vermelho.png"]

func _ready():
	self.texture = load(sprites.pick_random())
