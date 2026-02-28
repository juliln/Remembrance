extends Area2D
class_name Interactable

@export var dialogue: DialogueNode


func interact(_player):
	var dm = get_tree().root.get_node("World (demo)/UI")
	
	if dm.is_open:
		return

	if dialogue:
		dm.start_dialogue(dialogue)
