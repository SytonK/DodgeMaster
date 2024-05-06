class_name Spawner
extends Node2D

@export var frequency: float = 1
var frequency_timer: Timer

func _ready():
	_init_frequency_timer()

func _init_frequency_timer() -> void:
	frequency_timer = Timer.new()
	frequency_timer.name = "FrequencyTimer"
	frequency_timer.autostart = true
	frequency_timer.wait_time = frequency
	frequency_timer.timeout.connect(_spawn)
	add_child(frequency_timer)


func _spawn() -> void:
	print('test')
