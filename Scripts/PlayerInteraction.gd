extends Node

var nearby: Interactable = null

func _input(event):
	if event.is_action_pressed("interact") and nearby:
		nearby.interact(get_parent())
		
func _on_interaction_area_entered(area):
	if area is Interactable:
		nearby = area
		
func _on_interaction_area_exited(area):
	if area == nearby:
		nearby = null


func _on_interaction_area_area_entered(_area: Area2D) -> void:
	pass # Replace with function body.


func _on_interaction_area_area_exited(_area: Area2D) -> void:
	pass # Replace with function body.
