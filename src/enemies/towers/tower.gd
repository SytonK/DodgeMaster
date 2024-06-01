class_name Tower
extends StaticBody2D


var spawner: Spawner
@export var frequency: float = 1
@export var scene_to_spawn: PackedScene


func _ready() -> void:
	_init_spawner()


func _init_spawner() -> void:
	spawner = Spawner.new()
	spawner.frequency = frequency
	spawner.scene_to_spawn = scene_to_spawn
	spawner.scene_spawned.connect(_on_spawner_scene_spawned)
	add_child(spawner)

func _on_spawner_scene_spawned(scene: PackedScene) -> void:
	print(scene)
