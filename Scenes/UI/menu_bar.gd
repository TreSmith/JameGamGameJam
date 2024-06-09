extends Control

@onready var money = %Money
@onready var level = %Level
@onready var view_deck_text = $menu_bar_area/ViewDeck
@onready var decklist = $ColorRect/Decklist
@onready var color_rect = $ColorRect

signal view_deck

func _ready():
	update_labels()

func update_labels():
	money.text = "Money: $" + str(GameManager.Current_Money)
	view_deck_text.text = "Deck Size: " + str(GameManager.Current_Deck.size())
	if SceneManager.current_scene_type == SceneManager.SceneType.Level:
		level.text = "Level: " + str(SceneManager.current_level)
	else:
		level.text = "Shop"


func _on_view_deck_pressed():
	color_rect.visible = true
	decklist.text = GameManager.print_deck()
	view_deck.emit()


func _on_close_deck_pressed():
	color_rect.visible = false
