extends VBoxContainer



@export var card_scene : PackedScene

func _ready() -> void:
	generate_shop()
	
		

func generate_shop():
	var card
	for i in 5:	
		card = GameManager.get_random_card_from_pool()
		var c = card_scene.instantiate()
		c.ID = card["ID"]
		c.BAC = card["BAC"]
		c.cost = card["Cost"]
		c.fort = card["FORT"]
		c.cardname = card["Name"]
		c.cards = card["Card"]
		c.energy = card["Energy"]
		c.retain = card["Retain"]
		add_child(c)

