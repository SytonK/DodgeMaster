class_name TargetPlayerTower
extends Tower


const SHOOT_COLOR_MODDLATE_FACTOR: float = 0.001


@export var disabled: bool = false : set = _on_set_disable

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var projectile_speed: float = 300
@export var max_distance_from_axis: float

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var bullet_audio_player_2d: AudioStreamPlayer2D = $BulletAudioPlayer2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _ready() -> void:
	super._ready()
	_on_set_disable(disabled)


func _on_spawner_scene_spawned(projectile) -> void:
	projectile.direction = Globals.player_ref.position - global_position
	projectile.rotation = projectile.direction.angle()
	projectile.speed = projectile_speed
	projectile.modulate = Color(0.8, 
		0.8 - projectile.speed * SHOOT_COLOR_MODDLATE_FACTOR, 
		0.8 - projectile.speed * SHOOT_COLOR_MODDLATE_FACTOR)
	projectile.max_distance_from_axis = max_distance_from_axis
	animation_player.play('fire_bullet')
	bullet_audio_player_2d.play()


func _on_set_disable(new_val: bool) -> void:
	disabled = new_val
	if spawner:
		spawner.process_mode = Node.PROCESS_MODE_DISABLED if disabled else Node.PROCESS_MODE_INHERIT
	if sprite_2d:
		sprite_2d.self_modulate = Color(0.5, 0.5, 0.5) if disabled else Color(0.8, 0.5, 0.5)
	if !disabled:
		audio_stream_player.play()
		animation_player.play('build_tower')


