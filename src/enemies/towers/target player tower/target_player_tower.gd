extends Node2D


const COLOR_MODDLATE_FACTOR: float = 0.001


@export var projectile_speed: int = 300


func _on_spawner_scene_spawned(projectile: Projectile) -> void:
	projectile.direction = Globals.player_ref.position - projectile.position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR)
