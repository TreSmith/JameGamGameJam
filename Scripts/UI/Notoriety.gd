extends Panel

@onready var notoriety_bar = $NotorietyBar
@onready var notoriety_label = $NotorietyLabel

var required_notoriety = 0


func add_requirements(requirements):
	required_notoriety = requirements
	notoriety_bar.max_value = required_notoriety
	update_notoriety_ui()

func update_notoriety_ui():
	notoriety_bar.value = GameManager.Current_Notoriety
	var notoriety_left = required_notoriety - GameManager.Current_Notoriety
	if notoriety_left > 0:
		notoriety_label.text = "Required Notoriety: " + str(notoriety_left)
	else:
		var current_bonus_notoriety = int((GameManager.Current_Notoriety - required_notoriety)/20)
		GameManager.Current_Bonus = current_bonus_notoriety
		notoriety_label.text = "YOU ARE NOTORIOUS!! BONUS CASH: $" + str(GameManager.Current_Bonus) 	

