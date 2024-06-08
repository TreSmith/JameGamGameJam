extends Panel

@onready var notoriety_bar = $NotorietyBar
@onready var notoriety_label = $NotorietyLabel

var requiredNotoriety = 0

func fillLabels(requirements):
	requiredNotoriety = requirements
	notoriety_bar.value = 0
	notoriety_label.text = "Required Notoriety: " + str(requiredNotoriety)

func update_notoriety_ui(notoriety):
	notoriety_bar.value += notoriety
	notoriety_label.text = "Required Notoriety: " + str(notoriety_bar.value)

