extends Node

@onready var interaction_area: Area2D = $"../InteractionArea"
@onready var dm = $"../../UI"

func _process(_delta):
	if Input.is_action_just_pressed("interact"):
		if dm.is_open:
			dm.next_line()
			return
	for area in interaction_area.get_overlapping_areas():
		if area is Interactable:
			if Input.is_action_just_pressed("interact"):
				print("showing dialogue, dm is: ", dm)
				dm.toggle()
			return
