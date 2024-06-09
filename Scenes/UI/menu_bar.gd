extends Control

@onready var money = %Money
@onready var level = %Level

signal view_deck

func _ready():
	update_labels()

func update_labels():
	money.text = "Money: $" + str(GameManager.Current_Money)
	if SceneManager.current_scene_type == SceneManager.SceneType.Level:
		level.text = "Level: " + str(SceneManager.current_level)
	else:
		level.text = "Shop"


func _on_view_deck_pressed():
	view_deck.emit()
