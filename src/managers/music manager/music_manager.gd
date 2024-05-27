class_name MusicPlayer
extends AudioStreamPlayer

const EASY_MUSIC = preload("res://assets/sounds/music/easy.wav")
const NORMAL_MUSIC = preload("res://assets/sounds/music/normal.wav")
const HARD_MUSIC = preload("res://assets/sounds/music/hard.wav")

enum MusicLevels {
	EASY,
	NORMAL,
	HARD
}


func _ready() -> void: 
	set_music(MusicLevels.EASY)


func set_music(music_level: MusicLevels) -> void:
	match music_level:
		MusicLevels.EASY:
			stream = EASY_MUSIC
		MusicLevels.NORMAL:
			stream = NORMAL_MUSIC
		MusicLevels.HARD:
			stream = HARD_MUSIC
	
	play()
