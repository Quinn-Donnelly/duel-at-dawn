class_name MovementComponent
extends Node2D

## Speed at which player will move
@export var movement_speed: float = 100

func _ready() -> void:
	owner.set_meta(Constants.MOVEMENT_COMPONENT, self)

func _process(_delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	owner.velocity.x = movement_speed * direction
	
func _exit_tree() -> void:
	owner.remove_meta(Constants.MOVEMENT_COMPONENT)
