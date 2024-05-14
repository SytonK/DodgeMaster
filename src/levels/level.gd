class_name Level
extends Node2D


const LEVEL_UI = preload("res://src/UI/level ui/level_ui.tscn")
@onready var game_over_menu: Control
@onready var pause_menu: Control


const PLAYER = preload("res://src/player/player.tscn")
@onready var player: Player


func _ready() -> void:
	_add_player()
	_add_level_ui()

func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	player.game_over.connect(_on_player_game_over)

func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUi/GameOverMenu
	pause_menu = $LevelUi/PauseMenu


func _on_player_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED
