extends CharacterBody2D

@export var move_speed: float = 100

func _physics_process(_delta: float) -> void:
	# Get input direction
	var input_direction = Vector2(
		Input.get_action_strength("Right") - Input.get_action_strength("Left"),
		Input.get_action_strength("Down") - Input.get_action_strength("Up")
	)
	
	# Update velocity
	velocity = (input_direction * move_speed) 
	if Input.get_action_strength("Sprint"):
		velocity *= 1.5
		
	# Move and Slide functions
	move_and_slide()
