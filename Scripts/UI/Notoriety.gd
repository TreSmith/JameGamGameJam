extends Panel

@onready var notoriety_bar = $NotorietyBar
@onready var notoriety_label = $NotorietyLabel

var required_notoriety = 0

func fillLabels(requirements):
	print("Requirements: " + str(requirements))
	required_notoriety = requirements
	notoriety_bar.value = 0
	notoriety_label.text = "Required Notoriety: " + str(required_notoriety)

func update_notoriety_ui(notoriety):
	notoriety_bar.value = GameManager.Current_Notoriety
	required_notoriety - GameManager.Current_Notoriety
	notoriety_label.text = "Required Notoriety: " + str(required_notoriety)
