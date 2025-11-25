class_name Player
extends CharacterBody2D

@onready var fighter: Fighter = $Fighter
@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

func _process(_delta: float) -> void:
	if velocity and animationPlayer.current_animation == "idle":
		animationPlayer.play("walk")
	if animationPlayer.current_animation == "walk" and not velocity:
		animationPlayer.play("idle")
	move_and_slide()

func get_fighter() -> Fighter:
	return fighter
