class_name Projectile
extends Hitbox


@export var speed: float = 300
@export var direction: Vector2 : set = _set_direction

@export var max_distance_from_axis: float = 5000


func _process(delta: float) -> void:
	position += direction * speed * delta
	_queue_free_over_max_distance()


func _queue_free_over_max_distance() -> void:
	if abs(global_position.x) > max_distance_from_axis or abs(global_position.y) > max_distance_from_axis:
		queue_free()


func _set_direction(new_direction: Vector2) -> void:
	if new_direction == Vector2.ZERO:
		queue_free()
	else:
		direction = new_direction.normalized()


func _on_hit() -> void:
	queue_free()
