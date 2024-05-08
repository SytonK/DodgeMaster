class_name Spawner
extends Node2D

signal scene_spawned(scene: PackedScene)

@export var frequency: float = 1 : set = _set_frequency
var frequency_timer: Timer

@export var scene_to_spawn: PackedScene

func _ready() -> void:
	_init_frequency_timer()

func _init_frequency_timer() -> void:
	frequency_timer = Timer.new()
	frequency_timer.name = "FrequencyTimer"
	frequency_timer.autostart = true
	frequency_timer.wait_time = frequency
	frequency_timer.timeout.connect(_spawn)
	add_child(frequency_timer)


func _spawn() -> void:
	var new_scene: = scene_to_spawn.instantiate()
	scene_spawned.emit(new_scene)
	add_child(new_scene)


func _set_frequency(new_frequency: float) -> void:
	if frequency_timer && new_frequency > 0:
		frequency = new_frequency
		frequency_timer.wait_time = frequency
