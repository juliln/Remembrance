extends CharacterBody2D

@export var move_speed: float = 100
var sprint = 1.5
var current_dir = "Down"

func _physics_process(_delta: float) -> void:
	_player_movement(_delta)

func _player_movement(_delta: float):
	
	if Input.is_action_pressed("Sprint"):
		sprint = 1.5
	else:
		sprint = 1
	
	if Input.is_action_pressed("Left"):
		velocity.x = -move_speed * sprint
		velocity.y = 0
		current_dir = "Left"
		_player_animator(true)
	elif Input.is_action_pressed("Right"):
		velocity.x = move_speed * sprint
		velocity.y = 0
		current_dir = "Right"
		_player_animator(true)
	elif Input.is_action_pressed("Up"):
		velocity.x = 0
		velocity.y = -move_speed * sprint
		current_dir = "Up"
		_player_animator(true)
	elif Input.is_action_pressed("Down"):
		velocity.x = 0
		velocity.y = move_speed * sprint
		current_dir = "Down"
		_player_animator(true)
	else:
		velocity.x = 0 
		velocity.y = 0
		_player_animator(false)
		
	# Move and Slide functions
	move_and_slide()

func _player_animator(movement: bool):
	var anim = $Sprite2D
	
	if current_dir == "Right":
		if movement:
			anim.play("Right")
		else:
			anim.play("Right Idle")
	elif current_dir == "Left":
		if movement:
			anim.play("Left")
		else:
			anim.play("LeftIdle")
	elif current_dir == "Up":
		if movement:
			anim.play("Up")
		else:
			anim.play("UpIdle")
	elif current_dir == "Down":
		if movement:
			anim.play("Down")
		else:
			anim.play("DownIdle")
