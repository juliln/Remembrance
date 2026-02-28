extends Node

const OPENING = "res://scenes/OpeningCutscene.tscn"
const WORLD = "res://Areas(Demos)/garden.tscn"
const ENDING = "res://scenes/Happy_End.tscn"

func _ready():
	call_deferred("go_to_opening")

func go_to_opening():
	await get_tree().process_frame
	await get_tree().process_frame
	var anim = get_tree().current_scene.get_node("AnimationPlayer")
	anim.animation_finished.connect(func(_n): 
		go_to_world(), CONNECT_ONE_SHOT
	)
	
func go_to_world():
	print("go to world")
	get_tree().change_scene_to_file(WORLD)

func go_to_ending():
	get_tree().change_scene_to_file(ENDING)
	await get_tree().node_added
	get_tree().current_scene.get_node("AnimationPlayer").animation_finished.connect(func(_n): get_tree().quit())
