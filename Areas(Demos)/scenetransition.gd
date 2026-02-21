extends Area2D

@export var target_anchor: NodePath

func _on_body_entered(body):
	if body is CharacterBody2D:
		var anchor = get_node(target_anchor)
		var camera = body.get_node("Camera2D")
		
		var tween = create_tween()
		tween.tween_property(camera, "global_position", anchor.global_position, 0.6)
