extends Area2D

@export var next_level_number: int

func _on_body_entered(_player: Player) -> void:
	call_deferred("change_scene")

func change_scene() -> void:
	get_tree().change_scene_to_file("res://src/levels/level " + str(next_level_number) + "/level_" + str(next_level_number) + ".tscn")
