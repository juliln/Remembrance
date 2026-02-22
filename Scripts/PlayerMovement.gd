extends CharacterBody2D

class_name Player

@export var move_speed: float = 70
var current_dir = 0
var sprint = 1.5

func _physics_process(_delta: float) -> void:
	_player_movement()

func _player_movement() -> void:

	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")

	if input_direction.length() != 0:
		current_dir = wrapi(int(input_direction.angle() / (PI/2)), 0, 4)
		$Sprite2D.play(str(current_dir) + "Move")
	else:
		$Sprite2D.play(str(current_dir) + "Idle")

	sprint = 1.5 if Input.get_action_strength("Sprint") else 1
	velocity = (input_direction * move_speed * sprint)
	move_and_slide()

func _ready():
	NavigationManager.on_trigger_player_spawn.connect(_on_spawn)

	
func _on_spawn(position: Vector2, direction: String):
	global_position = position
	
	await get_tree().process_frame
	
	var camera = $Camera2D
	if camera:
		camera.force_update_scroll()
		
	print("Spawning at:", position)

func _on_interaction_area_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.


func _on_interaction_area_area_shape_exited(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	pass # Replace with function body.


func _on_interaction_area_area_entered(area: Area2D) -> void:
	pass # Replace with function body.


func _on_interaction_area_area_exited(area: Area2D) -> void:
	pass # Replace with function body.
