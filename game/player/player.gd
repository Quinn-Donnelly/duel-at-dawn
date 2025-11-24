class_name Player
extends CharacterBody2D

@onready var fighter: Fighter = $Fighter

func _process(_delta: float) -> void:
	move_and_slide()

func get_fighter() -> Fighter:
	return fighter
