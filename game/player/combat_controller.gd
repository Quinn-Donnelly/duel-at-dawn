class_name CombatController
extends Node

@export var hitBox: HitBox
@export var audioPlayer: AudioStreamPlayer2D
@export var animationPlayer: AnimationPlayer

@export var comboWindow: bool = false
var wantsCombo: bool = false
var isPunching: bool = false

func _ready() -> void:
	assert(animationPlayer, "CombatController must have an animation Player")
	assert(audioPlayer, "CombatController must have an audio player")
	assert(hitBox, "Combat controller must have a hitbox")
	hitBox.hit.connect(self._on_hit)

func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("punch"):
		if not isPunching:
			_punch()
		
		if comboWindow:
			wantsCombo = true
	if Input.is_action_just_pressed("uppercut"):
		_uppercut()

func _on_hit() -> void:
	audioPlayer.play()

func _punch() -> void:
	isPunching = true
	animationPlayer.play("jab")

func _uppercut() -> void:
	animationPlayer.play("uppercut")

func _on_punch_finished() -> void:
	if wantsCombo:
		animationPlayer.play("uppercut")
		return
	
	isPunching = false
	animationPlayer.play("idle")
	
func _on_uppercut_finished() -> void:
	isPunching = false
	wantsCombo = false
	animationPlayer.play("idle")
