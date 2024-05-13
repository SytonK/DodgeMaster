extends Control


const LEVEL_1 = preload("res://src/levels/level 1/level_1.tscn")


func _on_pressed() -> void:
	get_tree().change_scene_to_packed(LEVEL_1)
