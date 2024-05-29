class_name TargetPlayerTower
extends StaticBody2D


const SHOOT_COLOR_MODDLATE_FACTOR: float = 0.001


@export var disabled: bool = false : set = _on_set_disable

@onready var sprite_2d: Sprite2D = $Sprite2D

@onready var spawner: Spawner = $Spawner

@export var frequency: float
@export var projectile_speed: float = 300
@export var max_distance_from_axis: float

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	_on_set_disable(disabled)
	spawner.frequency = frequency


func _on_spawner_scene_spawned(projectile: Projectile) -> void:
	projectile.direction = Globals.player_ref.position - global_position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * SHOOT_COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * SHOOT_COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = max_distance_from_axis


func _on_set_disable(new_val: bool) -> void:
	disabled = new_val
	if spawner:
		spawner.process_mode = Node.PROCESS_MODE_DISABLED if disabled else Node.PROCESS_MODE_INHERIT
	if sprite_2d:
		sprite_2d.self_modulate = Color(0.5, 0.5, 0.5) if disabled else Color(0.8, 0.5, 0.5)
	if !disabled and audio_stream_player:
		audio_stream_player.play()
