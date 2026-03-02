extends Area2D

class_name EndingDoor

@export var spawn_direction: String = "up"

@onready var spawn: Node2D = $Spawn

var _is_transitioning := false


func _ready() -> void:
	body_shape_entered.connect(_on_body_shape_entered)


func _on_body_shape_entered(
	body_rid: RID,
	body: Node2D,
	body_shape_index: int,
	local_shape_index: int
) -> void:

	if _is_transitioning:
		return

	if body is Player:
		print('ending here') 
		_is_transitioning = true 
		SceneManager.go_to_ending()
