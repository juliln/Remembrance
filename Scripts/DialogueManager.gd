extends Node

var is_open: bool = false
var current_line: int = 0
var lines: Array[String] = [
	"OMG it's Kris.",
	"You were in Brianna's dorm!",
	"You always wore that cute dress to any event."
]
@onready var label = $UI/DialogueLabel

func show_ui():
	current_line = 0
	is_open = true
	label.text = lines[current_line]
	label.visible = true
	$UI.visible = true

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
		show_ui()
		
