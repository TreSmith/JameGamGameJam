extends Node2D

@export var requiredNotoriety : int = 100
@export var fortitude_loss_per_turn : int = 1
@export var level_complete_bonus : int = 10

var current_fortitude_loss = 0
var current_notoriety = 0

@onready var player_bars = %PlayerBars
@onready var notoriety = %Notoriety
@onready var hand = %Hand
@onready var menu_bar = $UI_Layer/menu_bar
@onready var energy_ui = %Energy_UI
@onready var next_level_ui = $UI_Layer/NextLevel_UI

func _ready():
	notoriety.add_requirements(requiredNotoriety)
	hand.generate_hand(GameManager.Handsize)
	menu_bar.update_labels()
	next_level_ui.visible = false;

func _on_next_level_ui_next_level():
	hand.delete_hand()
	GameManager.Current_Money += (level_complete_bonus + GameManager.Current_Bonus)
	GameManager.resetLevel()
	SceneManager.next_level()


func _on_end_turn_ui_end_turn():
	current_fortitude_loss += fortitude_loss_per_turn
	GameManager.Current_Fortitude -= current_fortitude_loss
	GameManager.Current_Notoriety += GameManager.Current_BAC
	notoriety.update_notoriety_ui()
	player_bars.update_bac()
	player_bars.update_fort()
	hand.delete_hand()
	hand.generate_hand(GameManager.Handsize)
	energy_ui.update_label()
	is_game_over()
	is_requirements_passed()

func _on_hand_change_energy():
	energy_ui.update_label()

func is_game_over():
	if GameManager.Current_Fortitude <= GameManager.Current_BAC:
		if GameManager.Current_Notoriety < requiredNotoriety:
			SceneManager.lose_game()
		else:
			_on_next_level_ui_next_level()

func is_requirements_passed():
	if GameManager.Current_Notoriety >= requiredNotoriety:
		next_level_ui.visible = true

