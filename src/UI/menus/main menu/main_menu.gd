extends VBoxContainer

const SANDBOX = preload("res://src/levels/sandbox/sandbox.tscn")


func _on_sandbox_button_pressed() -> void:
	get_tree().change_scene_to_packed(SANDBOX)
