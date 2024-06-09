extends Control

@onready var money = $UI_Layer/menu_bar_area/Money
@onready var level = $UI_Layer/menu_bar_area/Level

func _ready():
	update_labels()

func update_labels():
	money.text = "Money: $" + str(GameManager.Current_Money)
	if SceneManager.current_scene_type == SceneManager.SceneType.Level:
		level.text = "Level: " + str(SceneManager.current_level)
	else:
		level.text = "Shop"
