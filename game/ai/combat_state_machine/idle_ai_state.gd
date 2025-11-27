class_name IdleAiState
extends State

## Range on the punch that should look to take action
@export var punch_range: float = 10
@export var punch_cooldown: Timer
var combatStateMachine: AiCombatStateMachine

func _ready() -> void:
	assert(punch_cooldown, "must have punch cooldown")
	combatStateMachine = get_parent() as AiCombatStateMachine
	assert(combatStateMachine is AiCombatStateMachine, "AiIdle must have an AiStateMachine")

func physics_process(_delta: float) -> void:
	if combatStateMachine.get_distance_to_player() <= punch_range:
		if punch_cooldown.is_stopped():
			combatStateMachine.change_state("Attack")
		else:
			combatStateMachine.change_state("MoveAway")
