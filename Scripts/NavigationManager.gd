extends Node

const scene_garden = preload("res://Areas(Demos)/garden.tscn")
const scene_hallway = preload("res://Areas(Demos)/hallway.tscn")
const scene_library = preload("res://Areas(Demos)/library.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):

	var scene_to_load
	
	match level_tag:
		"garden":
			scene_to_load = scene_garden
		"hallway":
			scene_to_load = scene_hallway
		"library":
			scene_to_load = scene_library

	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
		call_deferred("_spawn_player")
		
	print("Going to:", level_tag, "via door:", destination_tag)

func trigger_player_spawn(position: Vector2, direction: String):
	on_trigger_player_spawn.emit(position, direction)

func _spawn_player():

	await get_tree().process_frame
	await get_tree().process_frame   # ← add this second wait

	var current_scene = get_tree().current_scene
	
	if current_scene == null:
		print("Scene still null!")
		return

	if spawn_door_tag == null:
		return
	print("Looking for door tag:", spawn_door_tag)
	print("Current scene is:", get_tree().current_scene.name)
	
	var door_path = "Doors/Door_" + spawn_door_tag
	
	if not current_scene.has_node(door_path):
		print("Door not found:", door_path)
		return
	
	var door = current_scene.get_node(door_path)
	
	trigger_player_spawn(
		door.spawn.global_position,
		door.spawn_direction
	)
	
	spawn_door_tag = null
