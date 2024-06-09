extends Control

signal end_turn

@onready var drink = $Drink

func _on_end_turn_pressed():
	drink.play()
	end_turn.emit()
