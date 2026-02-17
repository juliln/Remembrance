extends Area2D
class_name Interactable

@export var dialogue_text: String = ""

func interact(_player):
	if DialogueManager.is_open:
		return
	if dialogue_text != "":
		DialogueManager.show_dialogue(dialogue_text)
		
