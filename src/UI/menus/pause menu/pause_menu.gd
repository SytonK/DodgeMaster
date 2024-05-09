extends Control


@export var is_active: bool = true


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print('lama')
		visible = !visible
		get_tree().paused = !get_tree().paused
