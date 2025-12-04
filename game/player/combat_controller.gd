class_name CombatController
extends Node

@export var hitBox: HitBox
@export var audioPlayer: AudioStreamPlayer2D
@export var animationPlayer: AnimationPlayer
@onready var hitStop: HitStop = $HitStop

@export var comboWindow: bool = false
var wantsCombo: bool = false
var isPunching: bool = false

func _ready() -> void:
	assert(animationPlayer, "CombatController must have an animation Player")
	assert(audioPlayer, "CombatController must have an audio player")
	assert(hitBox, "Combat controller must have a hitbox")
	hitBox.hit.connect(self._on_hit)
	hitBox.damage_dealt.connect(self._on_damage_dealt)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("punch"):
		if not isPunching:
			_punch()
		
		if comboWindow:
			wantsCombo = true
	
func _on_hit() -> void:
	audioPlayer.play()

func _on_damage_dealt(damage: int) -> void:
	if damage >= GameConstants.BIG_HIT:
		hitStop.hit_stop()

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
