class_name Card
extends Control

signal reparent_requested(which_card_ui: Card)
signal energy_changed()

@onready var state: Label = $State
@onready var costlabel = $Cost
@onready var bac = $BAC
@onready var cardslabel = $Cards
@onready var energylabel = $Energy
@onready var retainlabel = $Retain
@onready var fortitude = $Fortitude
@onready var played_card = $PlayedCard
@onready var cannot_play = $CannotPlay


@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []
@onready var card_released_state = %CardReleasedState


var cardname = "Temp"
var ID = 0
@export var BAC = 0
@export var cost = 3
@export var fort = 0
@export var cards = 0
@export var energy = 0
@export var retain = 1


func _ready() -> void:
	card_state_machine.init(self)
	state.text = cardname
	costlabel.text = str(cost)
	bac.text = (bac.text + str(BAC))
	cardslabel.text = (cardslabel.text + str(cards))
	energylabel.text = (energylabel.text + str(energy))
	retainlabel.text = (retainlabel.text + str(retain))
	fortitude.text = (fortitude.text + str(fort))
	
func _input(event: InputEvent) -> void:
	card_state_machine.on_input(event)
	
func _on_gui_input(event: InputEvent) -> void:
	card_state_machine.on_gui_input(event)
	
func _on_mouse_entered() -> void:
	card_state_machine.on_mouse_entered()
	
func _on_mouse_exited() -> void:
	card_state_machine.on_mouse_exited()


func _on_drop_point_detector_area_entered(area: Area2D) -> void:
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_exited(area: Area2D) -> void:
	targets.erase(area)

func discardcard():
	GameManager.discard_card(ID)
	queue_free()
	
func _on_card_released_state_cardplayed():
	if ((GameManager.Current_Energy - cost) >= 0):
		played_card.play()
		GameManager.discard_card(ID)
		GameManager.Current_Fortitude += fort
		GameManager.Current_BAC += BAC
		GameManager.Handsize += cards
		GameManager.Current_Energy -= cost
		energy_changed.emit()
		GameManager.Energy += energy
		GameManager.Retain += retain
		var tw = create_tween().set_parallel().set_trans(Tween.TRANS_QUAD)
		tw.tween_property(self, "scale", get_parent().get_parent().scale * 3, 0.3)
		tw.tween_property(self, "modulate:a", 0.0, 0.3)
		await tw.finished
		queue_free()
	else:
		cannot_play.play()
