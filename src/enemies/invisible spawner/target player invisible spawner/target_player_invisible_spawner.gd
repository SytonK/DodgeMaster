extends Node2D


enum SIDE { left, right, top, bottom }


const COLOR_MODDLATE_FACTOR: float = 0.001


@export var projectile_speed: int = 300
@export var radius: int


func _on_spawner_scene_spawned(projectile: Projectile) -> void:
	projectile.position = _get_random_position()
	projectile.direction = Globals.player_ref.position - projectile.global_position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = radius

func _get_random_position() -> Vector2:
	var spawn_point: Vector2
	var side_index: SIDE = randi_range(0, 3) as SIDE
	
	match side_index:
		SIDE.left:
			spawn_point = Vector2(-1, randf_range(-1, 1))
		SIDE.right:
			spawn_point = Vector2(1, randf_range(-1, 1))
		SIDE.top:
			spawn_point = Vector2(randf_range(-1, 1), -1)
		SIDE.bottom:
			spawn_point = Vector2(randf_range(-1, 1), 1)
	spawn_point *= radius
	
	return spawn_point
