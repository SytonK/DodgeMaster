class_name Projectile
extends Hitbox


@export var speed: float = 300
@export var direction: Vector2 : set = _set_direction


func _process(delta: float) -> void:
	position += direction * speed * delta


func _set_direction(new_direction: Vector2) -> void:
	if new_direction == Vector2.ZERO:
		queue_free()
	else:
		direction = new_direction.normalized()


func _on_hit() -> void:
	queue_free()
