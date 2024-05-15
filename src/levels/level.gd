class_name Level
extends Node2D


const LEVEL_UI = preload("res://src/UI/level ui/level_ui.tscn")
var game_over_menu: Control
var pause_menu: Control


const PLAYER = preload("res://src/player/player.tscn")
var player: Player


@export var level_times: Array[int]
var timer: Timer
var time_left: int
var level_time_index: int = 0
var time_label: Label


func _ready() -> void:
	_add_player()
	_add_level_ui()
	_add_timer()

func _add_player() -> void:
	player = PLAYER.instantiate()
	add_child(player)
	player.game_over.connect(_on_player_game_over)

func _add_level_ui() -> void:
	add_child(LEVEL_UI.instantiate())
	game_over_menu = $LevelUi/GameOverMenu
	pause_menu = $LevelUi/PauseMenu
	time_label = $LevelUi/TimeLabel
	

func _add_timer() -> void:
	if level_times.size() > 0:
		timer = Timer.new()
		timer.autostart = true
		timer.timeout.connect(_on_timer_timeout)
		add_child(timer)
		time_left = level_times[0]
		time_label.text = str(time_left)


func _on_player_game_over() -> void:
	game_over_menu.visible = true
	get_tree().paused = true
	pause_menu.process_mode = Node.PROCESS_MODE_DISABLED

func _on_timer_timeout() -> void:
	time_left -= 1
	if time_left < 0:
		level_time_index += 1
		_on_level_next_index()
		if level_time_index <= level_times.size() - 1:
			time_left = level_times[level_time_index]
	
	time_label.text = str(time_left)

func _on_level_next_index() -> void:
	#change this code for the level
	pass
