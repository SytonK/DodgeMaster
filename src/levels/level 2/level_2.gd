extends Level


func _ready() -> void:
	super._ready()
	_init_player_position()

func _init_player_position() -> void:
	player.position = Vector2(0, 200)
