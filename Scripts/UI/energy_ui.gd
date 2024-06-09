extends Control

@onready var energy_count = $Energy_Count

func _ready():
	update_label()

func update_label():
	energy_count.text = str(GameManager.Current_Energy) + " / " + str(GameManager.BASE_ENERGY)
