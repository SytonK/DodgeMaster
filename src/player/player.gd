class_name Player
extends CharacterBody2D


@export var movement_speed: float = 500

var max_health: int = 4
var health: int = max_health : set = _set_health
@onready var health_ui: HealthUI = $CanvasLayer/HealthUI


func _ready() -> void:
	Globals.player_ref = self


func _process(_delta: float) -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed
	
	move_and_slide()


func _on_hurtbox_hurt() -> void:
	health -= 1


func _set_health(new_health: int) -> void:
	health = clamp(new_health, 0, max_health)
	health_ui.new_health(health)
	if health <= 0:
		_die()

func _die() -> void:
	print('player died')
