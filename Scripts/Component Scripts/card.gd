class_name Card
extends Control

signal reparent_requested(which_card_ui: Card)


@onready var color: ColorRect = $Color
@onready var state: Label = $State
@onready var card_state_machine: CardStateMachine = $CardStateMachine as CardStateMachine
@onready var drop_point_detector = $DropPointDetector
@onready var targets: Array[Node] = []
@onready var card_released_state = %CardReleasedState



@export var BAC = 0
@export var cost = 0
@export var fort = 0
@export var cards = 0
@export var energy = 0
@export var retain = 1


func _ready() -> void:
	card_state_machine.init(self)
	
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
	queue_free()
	
func _on_card_released_state_cardplayed():
	if ((GameManager.Current_Energy - cost) >= 0):
		GameManager.Current_Fortitude += fort
		GameManager.Current_BAC += BAC
		GameManager.Handsize += cards
		GameManager.Current_Energy -= cost
		GameManager.Energy += energy
		GameManager.Retain += retain
		var tw = create_tween().set_parallel().set_trans(Tween.TRANS_QUAD)
		tw.tween_property(self, "scale", get_parent().get_parent().scale * 3, 0.3)
		tw.tween_property(self, "modulate:a", 0.0, 0.3)
		await tw.finished
		queue_free()

