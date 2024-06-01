class_name ParallelInvisibleSpawner
extends RadiusInvisibleSpawner

const COLOR_MODDLATE_FACTOR: float = 0.001

@export var projectile_speed: float = 300

const PROJECTILE = preload("res://src/enemies attacks/projectiels/projectile.tscn")


func _ready() -> void:
	scene_to_spawn = PROJECTILE
	super._ready()

func _on_spawner_scene_spawned(projectile) -> void:
	super._on_spawner_scene_spawned(projectile)
	projectile.direction = _get_direction(projectile)
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 0.8, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = radius

func _get_direction(projectile: Projectile) -> Vector2:
	if abs(projectile.global_position.x) == radius:
		return Vector2(-projectile.global_position.x, 0)
	else:
		return Vector2(0,-projectile.global_position.y)
