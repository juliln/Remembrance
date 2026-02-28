extends Node

@onready var interaction_area: Area2D = $"../InteractionArea"
@onready var dm = DialogueManager

func _process(_delta):
	if dm == null:
		return

	if dm.in_choice:
		if Input.is_action_just_pressed("ui_up"): dm.navigate(-1)
		if Input.is_action_just_pressed("ui_down"): dm.navigate(1)
		if Input.is_action_just_pressed("interact"): 
			var choice = dm.confirm_choice()
			print("Player chose: ", choice) 
		return
	if Input.is_action_just_pressed("interact"):
		if dm.is_open:
			dm.next_line()
			return
		
	for area in interaction_area.get_overlapping_areas():
		if area is Interactable:
			if Input.is_action_just_pressed("interact"):
				area.interact(owner)
			return
	
