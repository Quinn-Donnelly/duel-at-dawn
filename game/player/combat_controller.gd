class_name CombatController
extends Node

@export var hitBox: HitBox
@export var audioPlayer: AudioStreamPlayer2D
@export var animationPlayer: AnimationPlayer

func _ready() -> void:
	assert(animationPlayer, "CombatController must have an animation Player")
	assert(audioPlayer, "CombatController must have an audio player")
	assert(hitBox, "Combat controller must have a hitbox")
	hitBox.hit.connect(self._on_hit)

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("punch"):
		_punch()

func _on_hit() -> void:
	audioPlayer.play()

func _punch() -> void:
	animationPlayer.play("jab")
