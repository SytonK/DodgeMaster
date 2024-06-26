class_name RadiusInvisibleSpawner
extends Node2D


enum SIDE { left, right, top, bottom }


@onready var spawner: Spawner

@export var frequency: float
@export var radius: float

@export var scene_to_spawn: PackedScene

func _ready() -> void:
	_init_spawner()

func _init_spawner() -> void:
	spawner = Spawner.new()
	spawner.frequency = frequency
	spawner.scene_to_spawn = scene_to_spawn
	spawner.scene_spawned.connect(_on_spawner_scene_spawned)
	add_child(spawner)


func _on_spawner_scene_spawned(scene) -> void:
	scene.position = _get_random_position()


func _get_random_position() -> Vector2:
	var spawn_point: Vector2
	var side_index: SIDE = randi_range(0, 3) as SIDE
	
	match side_index:
		SIDE.left:
			spawn_point = Vector2(-1, randf_range(-1, 1))
		SIDE.right:
			spawn_point = Vector2(1, randf_range(-1, 1))
		SIDE.top:
			spawn_point = Vector2(randf_range(-1, 1), -1)
		SIDE.bottom:
			spawn_point = Vector2(randf_range(-1, 1), 1)
	spawn_point *= radius
	
	return spawn_point
