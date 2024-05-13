extends Node2D


const COLOR_MODDLATE_FACTOR: float = 0.001

@onready var spawner: Spawner = $Spawner

@export var frequency: float
@export var projectile_speed: int = 300
@export var max_distance_from_axis: int


func _ready() -> void:
	spawner.frequency = frequency


func _on_spawner_scene_spawned(projectile: Projectile) -> void:
	projectile.direction = Globals.player_ref.position - global_position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = max_distance_from_axis
