extends Node2D

@export var requiredNotoriety = 100
@export var fortitude_loss_per_turn = 1

func _on_next_level_next_level():
	SceneManager.next_level()
