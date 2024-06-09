extends VBoxContainer



@export var card_scene : PackedScene

func _ready() -> void:
	generate_hand()


func generate_hand():
	var cards = GameManager.draw_card(8)
	for card in cards:	
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

