extends Node2D


@export var projectile_speed: int = 300


func _on_spawner_scene_spawned(scene: Projectile) -> void:
	scene.direction = Vector2.UP
	scene.speed = projectile_speed
