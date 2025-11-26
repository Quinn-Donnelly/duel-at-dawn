class_name IdleAiState
extends State

@export_flags_2d_physics var mask: int

func physics_process(_delta: float) -> void:
	if _get_distance_to_player() < 100:
		(get_parent() as StateMachine).change_state("MoveAway")
	
func _get_distance_to_player() -> float:
	var to_position = owner.global_position
	to_position.x -= 75
	var query = PhysicsRayQueryParameters2D.create(owner.global_position, to_position, mask, [self])
	var result = get_world_2d().direct_space_state.intersect_ray(query)
	if result and result["collider"] is Player:
		return result.position.x - owner.global_position.x
	
	return INF
