extends Node

@onready var initial = %Initial
@onready var how_to_play = %HowToPlay

func _ready():
	initial.visible = true
	how_to_play.visible = false

#handle start game
func _on_button_pressed():
	SceneManager.next_level()

func _on_how_to_play_pressed():
	initial.visible = false
	how_to_play.visible = true

func _on_exit_button_pressed():
	initial.visible = true
	how_to_play.visible = false


