extends Control

var ID = 1
var BAC
var cost
var fort
var cardname = "Test"
var cards
var energy
var retain


@onready var label = %Label


# Called when the node enters the scene tree for the first time.
func _ready():
	label.text = cardname
	pass # Replace with function body.


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
