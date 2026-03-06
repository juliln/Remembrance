extends Node

const OPENING = "res://Cutscenes/OpeningCutscene.tscn"
const WORLD = "res://Areas(Demos)/garden.tscn"
const ENDING = "res://Cutscenes/Happy_End.tscn"

func _ready():
	call_deferred("go_to_opening")

func go_to_opening():
	await get_tree().process_frame
	await get_tree().process_frame
	var anim = get_tree().current_scene.get_node("AnimationPlayer")
	if anim == null:
		go_to_world()
		return
	anim.animation_finished.connect(func(_n): 
		go_to_world()
	)
	
func go_to_world():
	get_tree().change_scene_to_file(WORLD)
	
func go_to_ending():
	get_tree().change_scene_to_file(ENDING)
	await get_tree().process_frame
	await get_tree().process_frame
	get_tree().current_scene.get_node("End_Scene/EndCamera").make_current()
	get_tree().current_scene.get_node("End_Scene/AnimationPlayer").animation_finished.connect(func(_n): get_tree().quit())
