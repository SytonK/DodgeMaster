extends StaticBody2D


@export var frequency: float
@export var projectile_speed: float = 300
@export var max_distance_from_axis: float

@onready var spawner: Spawner = $Spawner


func _ready() -> void:
	spawner.frequency = frequency
