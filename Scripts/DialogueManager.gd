extends Node
var is_open: bool = false
var current_line: int = 0
var in_choice: bool = false
var selected_choice: int = 0
var names: Array[String] = []

@onready var name_label = $UI/NameLabel
@export var lines: Array[String] = []
@onready var label = $UI/DialogueLabel
@onready var choice_label = $UI/ChoiceLabel

func show_ui(new_lines: Array[String], name: String = ""):
	lines = new_lines

	current_line = 0
	is_open = true
	label.text = lines[current_line]
	label.visible = true
	$UI.visible = true
	name_label.text = name
	
func show_choices(choice_list: Array[String]):
	in_choice = true
	selected_choice = 0
	choice_label.text = "> " + choice_list[0]
	choice_label.visible = true

func confirmation() -> int:
	in_choice = false
	choice_label.visible = false
	return selected_choice

func next_line():
	current_line += 1
	if current_line >= lines.size():
		hide_ui()
	else:
		label.text = lines[current_line]


func hide_ui():
	is_open = false
	label.visible = false
	$UI.visible = false
	
func toggle():
	if is_open:
		hide_ui()
	else:
		show_ui(lines)
