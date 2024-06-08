extends Node

func _ready():
	var path = ""
	if SceneManager.current_scene_type == SceneManager.SceneType.Level:		
		var level_num = str(SceneManager.current_level)
		path = "res://Scenes/Levels/level_%s.tscn" % level_num
	else:
		path = 	"res://Scenes/Levels/shop.tscn"
	var level = load(path).instantiate()
	add_child(level)
