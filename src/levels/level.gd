class_name Level
extends Node2D


@onready var game_over_menu: Control = $LevelUi/GameOverMenu
@onready var pause_menu: Control = $LevelUi/PauseMenu


@onready var player: Player = $Player


func _ready() -> void:
	player.game_over.connect(_on_player_game_over)


func _on_player_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
