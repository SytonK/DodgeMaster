class_name NextLevelPortal
extends Area2D

@export var next_level_number: int
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _on_body_entered(_player: Player) -> void:
	call_deferred("_change_scene")

func _change_scene() -> void:
	get_tree().change_scene_to_file("res://src/levels/level " + str(next_level_number) + "/level_" + str(next_level_number) + ".tscn")

func activate() -> void:
	animated_sprite_2d.play('active')
	animated_sprite_2d.modulate = Color(1,1,1)
	monitoring = true
