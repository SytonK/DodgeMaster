class_name TargetPlayerInvisibleSpawner
extends RadiusInvisibleSpawner


const COLOR_MODDLATE_FACTOR: float = 0.001

@export var projectile_speed: float = 300

const PROJECTILE = preload("res://src/enemies attacks/projectiels/projectile.tscn")


func _ready() -> void:
	scene_to_spawn = PROJECTILE
	super._ready()

func _on_spawner_scene_spawned(projectile) -> void:
	super._on_spawner_scene_spawned(projectile)
	projectile.direction = Globals.player_ref.position - projectile.global_position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = radius

