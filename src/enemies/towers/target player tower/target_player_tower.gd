extends Node2D


@export var projectile_speed: int = 300


func _on_spawner_scene_spawned(projectile: Projectile) -> void:
	projectile.direction = Globals.player_ref.position - projectile.position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
