extends Level


@onready var target_player_tower_bot_right: TargetPlayerTower = $TargetPlayerTowerBotRight
@onready var target_player_tower_bot_left: TargetPlayerTower = $TargetPlayerTowerBotLeft
@onready var target_player_tower_top_letf: TargetPlayerTower = $TargetPlayerTowerTopLetf
@onready var target_player_tower_top_right: TargetPlayerTower = $TargetPlayerTowerTopRight


func _on_normal_mode_enter() -> void:
	super._on_normal_mode_enter()
	_enable_towers()

func _on_hard_mode_enter() -> void:
	super._on_hard_mode_enter()

func _on_end_mode_enter() -> void:
	#change this code for the level
	pass


func _enable_towers() -> void:
	target_player_tower_bot_right.disabled = false
	await get_tree().create_timer(0.5).timeout
	target_player_tower_bot_left.disabled = false
	await get_tree().create_timer(0.5).timeout
	target_player_tower_top_letf.disabled = false
	await get_tree().create_timer(0.5).timeout
	target_player_tower_top_right.disabled = false
