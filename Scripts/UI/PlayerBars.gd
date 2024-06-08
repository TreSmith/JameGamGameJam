extends Panel

@onready var bac_bar = $BAC_Bar
@onready var fort_bar = $FORT_Bar
@onready var bac_label = $BAC_Label
@onready var fort_label = $FORT_Label

func _ready():
	bac_bar.value = GameManager.STARTING_BAC
	bac_label.text = "BAC: " + str(GameManager.STARTING_BAC)
	fort_bar.value = 0
	fort_label.text = "FORT: " + str(GameManager.STARTING_FORTITUDE)

func update_bac(amount):
	bac_bar.value += amount
	bac_label.text = "BAC: " + str(bac_bar.value)
	
func update_fort(amount):
	fort_bar.value += amount
	var fort_label_text = GameManager.STARTING_FORTITUDE - fort_bar.value
	fort_label.text = "FORT: " + str(fort_label_text)
	
