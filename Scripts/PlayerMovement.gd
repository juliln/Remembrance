extends CharacterBody2D

@export var move_speed: float = 100
var current_dir = 0
var sprint = 1.5

func _physics_process(_delta: float) -> void:
	_player_movement(_delta)

func _player_movement(_delta: float) -> void:
	
	#Get Input
	var input_direction = Input.get_vector("Left", "Right", "Up", "Down")
	
	#Play Animation
	if input_direction.length() != 0:
		current_dir = wrapi(int(input_direction.angle() / (PI/2)), 0, 4)
		$Sprite2D.play(str(current_dir) + "Move")
	else:
		$Sprite2D.play(str(current_dir) + "Idle")
	
	#Update velocity
	sprint = 1.5 if Input.get_action_strength("Sprint") else 1
	velocity = (input_direction * move_speed * sprint)
	move_and_slide()
