extends Node

enum SceneType {
	Menu,
	Level,
	Shop
}

var num_levels = 5
var current_level = 0
var current_scene_type = SceneType.Menu

var game_scene = "res://Scenes/Main.tscn"
var title_scene = "res://Scenes/UI/main_menu.tscn"
var game_over_scene = "res://Scenes/UI/game_over.tscn"

func restart():
	current_level = 0
	current_scene_type = SceneType.Menu
	GameManager.reset_data_to_start()
	get_tree().change_scene_to_file(title_scene)

func next_level():
	GameManager.Current_BAC = GameManager.STARTING_BAC
	GameManager.Current_Fortitude = GameManager.STARTING_FORTITUDE
	GameManager.Current_Notoriety = 0
	if current_scene_type != SceneType.Level && current_level <= num_levels:
		current_level += 1
		current_scene_type = SceneType.Level
		get_tree().change_scene_to_file(game_scene)
	elif current_scene_type == SceneType.Level && current_level < num_levels:
		current_scene_type = SceneType.Shop
		get_tree().change_scene_to_file(game_scene)
	else:
		restart()

func lose_game():
	GameManager.reset_data_to_start()
	get_tree().change_scene_to_file(game_over_scene)
