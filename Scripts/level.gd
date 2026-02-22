extends Node2D

		
func _on_level_spawn(destination_tag: String):
	var door_path = "Doors/Door_" + destination_tag
	
	if not has_node(door_path):
		print("Door path not found:", door_path)
		return
	
	var door = get_node(door_path) as Door
	
	print("Found door:", door.name)
	
	NavigationManager.trigger_player_spawn(door.spawn.global_position, door.spawn_direction)
	print("Spawn tag is:", NavigationManager.spawn_door_tag)
	
