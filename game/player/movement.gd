class_name MovementComponent
extends Node2D

## Speed at which player will move
@export var movement_speed: float = 100
@export var animationPlayer: AnimationPlayer

func _ready() -> void:
	owner.set_meta(Constants.MOVEMENT_COMPONENT, self)

func _process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	owner.global_position.x = owner.global_position.x + movement_speed * direction * delta
	if direction and animationPlayer:
		animationPlayer.play("walk")

func _exit_tree() -> void:
	owner.remove_meta(Constants.MOVEMENT_COMPONENT)
