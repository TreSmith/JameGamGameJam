extends Control

var ID = 1
var BAC
var cost
var fort
var cardname = "Test"
var cards
var energy
var retain


@onready var state = $State
@onready var costlabel = $Cost
@onready var bac = $BAC
@onready var cardslabel = $Cards
@onready var energylabel = $Energy
@onready var retainlabel = $Retain


# Called when the node enters the scene tree for the first time.
func _ready():
	state.text = cardname
	costlabel.text = str(cost)
	bac.text = (bac.text + str(BAC))
	cardslabel.text = (cardslabel.text + str(cards))
	energylabel.text = (energylabel.text + str(energy))
	retainlabel.text = (retainlabel.text + str(retain))



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	GameManager.add_card_to_deck(ID)
	var tw = create_tween().set_parallel().set_trans(Tween.TRANS_QUAD)
	tw.tween_property(self, "scale", get_parent().get_parent().scale * 3, 0.3)
	tw.tween_property(self, "modulate:a", 0.0, 0.3)
	await tw.finished
	queue_free()
