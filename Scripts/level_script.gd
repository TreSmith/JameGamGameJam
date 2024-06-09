extends Node2D

@export var requiredNotoriety : int = 100
@export var fortitude_loss_per_turn : int = 1


var current_fortitude_loss = 0
var current_notoriety = 0
var hitlerwascool = 5
var cardsplayed = [0, 0, 0, 0, 0]

@onready var player_bars = %PlayerBars
@onready var notoriety = %Notoriety
@onready var hand = %Hand

func _ready():
	notoriety.fillLabels(requiredNotoriety)
	hand.generate_hand(GameManager.Handsize)
	
	

func _on_next_level_next_level():
	SceneManager.next_level()

#handle next turn logic
#remove fortitude, check if fortitude matches current BAC, update progress bars, deal new hand
func _on_next_level_end_turn():
	current_fortitude_loss += fortitude_loss_per_turn
	GameManager.Current_BAC += 1
	GameManager.Current_Notoriety += GameManager.Current_BAC
	notoriety.update_notoriety_ui(current_notoriety)
	player_bars.update_bac(GameManager.Current_BAC)
	player_bars.update_fort(current_fortitude_loss)
	hand.delete_hand()
	hand.generate_hand(GameManager.Handsize)

