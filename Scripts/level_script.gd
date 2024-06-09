extends Node2D

@export var requiredNotoriety : int = 100
@export var fortitude_loss_per_turn : int = 1

var current_fortitude_loss = 0
var current_notoriety = 0

@onready var player_bars = %PlayerBars
@onready var notoriety = %Notoriety
@onready var hand = %Hand
@onready var menu_bar = $UI_Layer/menu_bar
@onready var energy_ui = %Energy_UI

func _ready():
	notoriety.fillLabels(requiredNotoriety)
	hand.generate_hand(GameManager.Handsize)
	menu_bar.update_labels()

func _on_next_level_ui_next_level():
	hand.delete_hand()
	SceneManager.next_level()
	GameManager.resetLevel()


func _on_end_turn_ui_end_turn():
	current_fortitude_loss += fortitude_loss_per_turn
	GameManager.Current_Fortitude -= current_fortitude_loss
	GameManager.Current_BAC += 1
	GameManager.Current_Notoriety += GameManager.Current_BAC
	notoriety.update_notoriety_ui()
	player_bars.update_bac()
	player_bars.update_fort()
	hand.delete_hand()
	hand.generate_hand(GameManager.Handsize)
	energy_ui.update_label()
	isGameOver()

func _on_hand_change_energy():
	energy_ui.update_label()

func isGameOver():
	if GameManager.Current_Fortitude <= GameManager.Current_BAC:
		if GameManager.Current_Notoriety < requiredNotoriety:
			SceneManager.lose_game()
		else:
			SceneManager.next_level()


