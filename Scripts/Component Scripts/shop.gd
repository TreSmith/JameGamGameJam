extends Node2D

@onready var menu_bar = $UI_Layer/menu_bar

func _ready():
	menu_bar.update_labels()

func _on_next_level_next_level():
	SceneManager.next_level()
