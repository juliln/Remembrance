extends Area2D
class_name Interactable
@export var npc_name: String = ""
@export var dialogue_lines: Array[String] = []
@export var choices_lines: Array[String] = ["Continue"]

func interact(_player):
	var dm = get_tree().root.get_node("World (demo)/UI")
	# var dm = get_tree().root.get_node("DialogueManager")
	
	if dm.is_open:
		if dm.in_choice:
			dm.confirmation()
		else:
			dm.next_line()
		return
	if dialogue_lines.size() > 0:
		dm.show_ui(dialogue_lines, npc_name)
		dm.show_choices(choices_lines)
		
