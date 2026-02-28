extends Node
var is_open: bool = false
var current_line: int = 0
var in_choice: bool = false
var current_choices: Array[String] = []
var selected_choice: int = 0
var current_node: DialogueNode
@export var lines: Array[String] = []
@onready var label = $UI/DialogueLabel
@onready var choice_label = $UI/ChoiceLabel

func show_ui(new_lines: Array[String]):
	lines = new_lines
	
	print(lines)
	current_line = 0
	is_open = true
	label.text = lines[current_line]
	label.visible = true
	$UI.visible = true
	
func show_choices(choice_array: Array[String]):
	in_choice = true
	selected_choice = 0
	current_choices = choice_array
	update_choice_text()
	choice_label.visible = true

func navigate(dir: int):
	selected_choice = wrapi(selected_choice + dir, 0, current_choices.size())
	update_choice_text()

func confirm_choice() -> int:
	in_choice = false
	choice_label.visible = false
	return selected_choice

func next_line():
	current_line += 1
	if current_line >= lines.size():
		if current_node == null:
			hide_ui()
			return
		if current_node.choices.size() > 0 and not in_choice:
			show_choices(current_node.choices)
			return
		else:
			hide_ui()
	else:
		label.text = lines[current_line]

func hide_ui():
	is_open = false
	in_choice = false
	
	current_node = null
	current_line = 0
	lines = []
	current_choices = []
	
	label.visible = false
	choice_label.visible = false
	$UI.visible = false
	
func toggle():
	if is_open:
		hide_ui()
	else:
		# Reopen with the current lines array
		show_ui(lines)
		
func _unhandled_input(event):
	if not is_open:
		return
	
	if in_choice:
		if Input.is_action_just_pressed("ui_up"):
			navigate(-1)
		elif Input.is_action_just_pressed("ui_down"):
			navigate(1)
		elif Input.is_action_just_pressed("interact"):
			var result = confirm_choice()
			handle_branch(result)
		return
	
	if Input.is_action_just_pressed("interact"):
		next_line()
		
func update_choice_text():
	var text :=""
	
	for i in current_choices.size():
		if i == selected_choice:
			text += "> " + current_choices[i] + "\n"
		else:
			text += " " + current_choices[i] + "\n"
			
	choice_label.text = text
	
func start_dialogue(node: DialogueNode):
	current_node = node
	show_ui(node.lines)
	
	if node.choices.size() > 0:
		show_choices(node.choices)
		
func handle_branch(choice_index: int):
	if current_node.branches.size() > choice_index:
		var next_node = current_node.branches[choice_index]
		start_dialogue(next_node)
	else:
		hide_ui()
