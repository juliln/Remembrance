extends Node

var is_open: bool = false

@onready var label = $UI/DialogueLabel

func show_ui():
	is_open = true
	label.text = "OMG it's Kris. You were in Brianna's dorm! You always wore that cute dress to any event."
	label.visible = true
	$UI.visible = true
	
func hide_ui():
	is_open = false
	label.visible = false
	$UI.visible = false

func toggle():
	if is_open:
		hide_ui()
	else:
		show_ui()
