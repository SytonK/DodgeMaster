class_name Level
extends Node2D


@onready var game_over_menu: Control = $CanvasLayer/GameOverMenu


func _on_player_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
