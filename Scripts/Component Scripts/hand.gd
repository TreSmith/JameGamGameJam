extends HBoxContainer

@export var card_scene : PackedScene

signal change_energy

func _ready() -> void:
	for child in get_children():
		var card_ui := child as Card
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)
		card_ui.energy_changed.connect(_on_change_energy)

func _on_card_ui_reparent_requested(child: Card) -> void:
	child.reparent(self)

func _on_change_energy() -> void:
	change_energy.emit()

func generate_hand(handsize):
	var cards = GameManager.draw_card(GameManager.Handsize)
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
		c.reparent_requested.connect(_on_card_ui_reparent_requested)
		c.energy_changed.connect(_on_change_energy)
	GameManager.Handsize = GameManager.DEFAULT_HANDSIZE
	GameManager.Current_Energy = GameManager.Energy
	GameManager.Energy = GameManager.DEFAULT_ENERGY
		
func delete_hand():
	if (GameManager.Retain > 0):
		GameManager.Retain = GameManager.Retain - 1
	else:
		for c in get_children():
			c.discardcard()
