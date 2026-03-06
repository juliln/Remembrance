extends Area2D
class_name Interactable
@export var dialogue_lines: Array[String] = []

func interact(_player):
	print("root", get_tree().root.get_children())
	var dm = get_tree().root.get_node("World (demo)/UI")
	# var dm = DialogueManager
	if dm.is_open:
		if dm.in_choice:
			dm.confirm_choice()
		else:
			dm.next_line()
		return
	if dialogue_lines.size() > 0:
		dm.show_ui(dialogue_lines)
		dm.show_choices()
