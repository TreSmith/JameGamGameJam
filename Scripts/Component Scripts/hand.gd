extends HBoxContainer

@export var card_scene : PackedScene

func _ready() -> void:
	for child in get_children():
		var card_ui := child as Card
		card_ui.reparent_requested.connect(_on_card_ui_reparent_requested)
		
func _on_card_ui_reparent_requested(child: Card) -> void:
	child.reparent(self)

func generate_hand(handsize):
	for i in handsize:
		var c = card_scene.instantiate()
		var card = GameManager.draw_card()
		c.ID = card["ID"]
		c.BAC = card["BAC"]
		c.cost = card["Cost"]
		c.fort = card["FORT"]
		c.cardname = card["Name"]
		c.cards = card["Card"]
		c.energy = card["Energy"]
		c.retain = card["Retain"]
		#c.state.text = c.cardname
		add_child(c)
		c.reparent_requested.connect(_on_card_ui_reparent_requested)
	GameManager.Handsize = GameManager.DEFAULT_HANDSIZE
	GameManager.Current_Energy = GameManager.Energy
	GameManager.Energy = GameManager.DEFAULT_ENERGY
		
func delete_hand():
	if (GameManager.Retain > 0):
		GameManager.Retain = GameManager.Retain - 1
	else:
		for c in get_children():
				c.discardcard()
