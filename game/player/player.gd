class_name Player
extends CharacterBody2D

@onready var hitBox: HitBox = $HitBox
@onready var audioPlayer: AudioStreamPlayer2D = $HitAudio

func _ready() -> void:
	hitBox.hit.connect(self._on_hit)
	
func _on_hit() -> void:
	audioPlayer.play()
