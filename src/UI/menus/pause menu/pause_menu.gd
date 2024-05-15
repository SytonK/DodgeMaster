extends Control


@export var is_active: bool = true


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		print('pause')
		_toggle_pause()

func _toggle_pause() -> void:
		visible = !visible
		get_tree().paused = !get_tree().paused


func _on_pause_button_pressed() -> void:
	_toggle_pause()
