class_name Player
extends CharacterBody2D

signal game_over


@export var movement_speed: float = 500

var max_health: int = 4
var health: int = max_health : set = _set_health
@onready var health_ui: HealthUI = $CanvasLayer/HealthUI

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
const LOSE_SOUND = preload("res://assets/sounds/sound effects/lose sound.mp3")

func _ready() -> void:
	Globals.player_ref = self


func _process(_delta: float) -> void:
	velocity = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized() * movement_speed
	
	move_and_slide()


func _on_hurtbox_hurt() -> void:
	audio_stream_player.play() 
	health -= 1


func _set_health(new_health: int) -> void:
	health = clamp(new_health, 0, max_health)
	health_ui.update_health(health)
	if health <= 0:
		_die()

func _die() -> void:
	_play_lose_sound()
	game_over.emit()

func _play_lose_sound() -> void:
	audio_stream_player.stream = LOSE_SOUND
	audio_stream_player.play()
	
