extends CharacterBody2D

@export var move_speed: float = 100

func _physics_process(_delta: float) -> void:
	# Get input direction
	var input_direction = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	var sprint = 1.5 if Input.get_action_strength("sprint") else 1
	
	# Update velocity
	velocity = (input_direction * move_speed * sprint) 
		
	# Move and Slide functions
	move_and_slide()
