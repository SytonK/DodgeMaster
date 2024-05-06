class_name player
extends CharacterBody2D

@export var movement_speed: float = 500

func _process(_delta: float) -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed
	
	move_and_slide()