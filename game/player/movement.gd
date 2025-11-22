class_name MovementComponent
extends Component

## Speed at which player will move
@export var movement_speed: float = 100

func _process(delta: float) -> void:
	var direction = Input.get_axis("move_left", "move_right")
	owner.global_position.x = owner.global_position.x + movement_speed * direction * delta
