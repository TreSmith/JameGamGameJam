
extends CardState

signal cardplayed
var played: bool

func enter() -> void:
	card_ui.color.color = Color.DARK_VIOLET
	card_ui.state.text = "RELEASED"
	
	played = false
	
	if not card_ui.targets.is_empty():
		played = true
		cardplayed.emit()

		
		
func on_input(_event: InputEvent) -> void:
	if not played:
		return
	await get_tree().create_timer(0.3).timeout
	transition_requested.emit(self, CardState.State.BASE)

