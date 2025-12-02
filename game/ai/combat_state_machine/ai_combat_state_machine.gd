class_name AiCombatStateMachine
extends StateMachine

@export_flags_2d_physics var mask: int

@export var stats: AiCombatStats

class AiCombatState extends Node:
	var punch_range: float
	var punch_cooldown: Timer
	
	func _init(stats: AiCombatStats) -> void:
		punch_cooldown = Timer.new()
		punch_cooldown.one_shot = true
		punch_cooldown.wait_time = stats.punch_cooldown if stats else 0.001
		
		punch_range = stats.punch_range
	
var state: AiCombatState

func _ready() -> void:
	super()
	state = AiCombatState.new(stats)

func get_distance_to_player() -> float:
	var to_position = owner.global_position
	to_position.x -= 75
	var query = PhysicsRayQueryParameters2D.create(owner.global_position, to_position, mask, [self])
	var result = get_world_2d().direct_space_state.intersect_ray(query)
	if result and result["collider"] is Player:
		return result.position.x - owner.global_position.x
	
	return INF
