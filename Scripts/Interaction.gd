extends Area2D
class_name Interactable

@export var dialogue_text: String = ""

func interact(_player):
	var dm = get_tree().root.get_node("World (demo)/UI")
	if dm.is_open:
		return
	if dialogue_text != "":
		dm.show_ui(dialogue_text)
