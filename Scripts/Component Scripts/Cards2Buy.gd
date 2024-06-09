extends VBoxContainer

signal update_money

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
		c.money_update.connect(_on_shopcard_money_update)
		add_child(c)

func _on_shopcard_money_update():
	update_money.emit()
