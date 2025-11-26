class_name MoveAwayAiState
extends State

## Speed of run away
@export var move_speed: float = 100

func enter() -> void:
	owner.velocity.x += move_speed 

func exit() -> void:
	owner.velocity = Vector2.ZERO
	
