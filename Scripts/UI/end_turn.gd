extends Control

signal end_turn

func _on_end_turn_pressed():
	end_turn.emit()
