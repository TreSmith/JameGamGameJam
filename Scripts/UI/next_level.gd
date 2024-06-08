extends Control

signal next_level
signal end_turn

func _on_next_level_btn_pressed():
	next_level.emit()

func _on_end_turn_pressed():
	end_turn.emit()

