extends Node

var is_open: bool = false

func show_dialogue(text: String):
	is_open = true
	print("DIALOGUE:", text)
	
func close_dialogue():
	is_open = false
