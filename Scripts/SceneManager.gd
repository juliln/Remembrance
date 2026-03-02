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
	anim.animation_finished.connect(func(_n): 
		go_to_world()
	)
	
func go_to_world():
	print("go to world")
	get_tree().change_scene_to_file(WORLD)

func go_to_ending():
	print("go to ending")
	get_tree().change_scene_to_file(ENDING)
	print("changed scene")
	await get_tree().node_added
	print("get tree")
	get_tree().current_scene.get_node("End_Scene/AnimationPlayer").animation_finished.connect(func(_n): get_tree().quit())
